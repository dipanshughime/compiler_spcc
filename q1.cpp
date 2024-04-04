#include <iostream>
#include <fstream>
#include <unordered_map>
#include <string>
using namespace std;
int main() {
    unordered_map<string, string> operators;
    string arithmetic_operator[] = {"+", "-", "*", "/", "%"};
    string relational_operator[] = {"==", "!=", ">", "<", ">=", "<="};
    string logical_operator[] = {"&&", "||", "!"};
    string assignment_operator[] = {"="};
    string bitwise_operator[] = {"&", "|", "^", "~", "<<", ">>"};

    for (const auto &op : arithmetic_operator)
        operators[op] = "Arithmetic Operator";
    for (const auto &op : relational_operator)
        operators[op] = "Relational Operator";
    for (const auto &op : logical_operator)
        operators[op] = "Logical Operator";
    for (const auto &op : assignment_operator)
        operators[op] = "Assignment Operator";
    for (const auto &op : bitwise_operator)
        operators[op] = "Bitwise Operator";

    ifstream source_code("sample.c");
    if (!source_code.is_open()) {
        cerr << "Failed to open file\n";
        return 1;
    }

    string line;
    int total = 0;
    while (getline(source_code, line)) {
        if (line[0] == '#')
            continue;
        int i = 0;
        while (i < line.length()) {
            string op = string(1, line[i]);
            if (operators.find(op) != operators.end()) {
                if (i + 1 < line.length() && operators.find(line.substr(i, 2)) != operators.end()) {
                    cout << line.substr(i, 2) << " is " << operators[line.substr(i, 2)] << endl;
                    i++;
                } else {
                    cout << line[i] << " is " << operators[op] << endl;
                }
                total++;
            }
            i++;
        }
    }
    source_code.close();
    cout << "Total Operators: " << total << endl;

    return 0;
}
