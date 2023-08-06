# include <iostream>

//# include <nlohmann/json.hpp>
# include <spdlog/spdlog.h>
# include <fmt/format.h>

# include "hello.h"
# include "version.hpp"




int main()
{
    std::cout<< project_name<< ", Version= "<<project_version<< std::endl;
    std::cout<< "Custom variable = "<<project_custom_variable<<std::endl;
    
    auto message = fmt::format("Welcome to {} v{}\n", project_name, project_version);
    spdlog::info(message);

    // std::cout<< "Json lib version: "
    //     <<NLOHMANN_JSON_VERSION_MAJOR<<"."
    //     <<NLOHMANN_JSON_VERSION_MINOR<<"."
    //     <<NLOHMANN_JSON_VERSION_PATCH<<std::endl;
    
    say_hello();
}