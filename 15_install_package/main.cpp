#include <iostream>

#include "addition.h"
#include "division.h"
#include "print_result.h"

int main(){

float first_no, second_no, result_add, result_div;

std::cout<< "Enter first number\t";
std::cin>> first_no;
std::cout<< "Enter second number\t";
std::cin>> second_no;

result_add = add(first_no , second_no);
result_div = div(first_no , second_no);

print("Addition", result_add);
print("Division", result_div);
//std::cout<< "Addition result:\t"<< result_add<< "\nDivision result:\t"<< result_div<< "\n";

return 0;
}
