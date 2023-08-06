# include <iostream>

# include "hello.h"
# include "version.hpp"

int main()
{
    std::cout<< project_name<< ", Version= "<<project_version<< std::endl;
    std::cout<< "Custom variable = "<<project_custom_variable<<std::endl;
    
    say_hello();
}