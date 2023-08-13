#include <iostream>

//# include <nlohmann/json.hpp>
#include <spdlog/spdlog.h>
#include <fmt/format.h>

#include "hello.h"
#include "version.hpp"

#include <cxxopts.hpp>



int main(int argc, char **argv)
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

    // Parse argument
    cxxopts::Options options(project_name.data());
    options.add_options("arguments")("h, help", "print usage");

    auto result = options.parse(argc,argv);
    if(result.count("help"))
    {
        std::cout<<options.help()<<'\n';
    }
}