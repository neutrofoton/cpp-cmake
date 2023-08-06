# include <iostream>

# include "hello.h"
# include "version.hpp"
# include <nlohmann/json.hpp>

int main()
{
    std::cout<< project_name<< ", Version= "<<project_version<< std::endl;
    std::cout<< "Custom variable = "<<project_custom_variable<<std::endl;
    
    std::cout<< "Json lib version: "
        <<NLOHMANN_JSON_VERSION_MAJOR<<"."
        <<NLOHMANN_JSON_VERSION_MINOR<<"."
        <<NLOHMANN_JSON_VERSION_PATCH<<std::endl;
    
    say_hello();
}