
# Steps adding external library from git source (as git sub module)
1. Create an external directory, then run git sub module from the root of chapter
    ```bash
    cd 22-using-external-lib-from-git-source
    mkdir external

    git submodule add https://github.com/nlohmann/json external/json
    ```

    It will generate <code>.gitmodules</code> in the root of directory.

2. Create a cmake custom definition in <code>cmake/AddGitSubmodule.cmake</code>
    ```bash
    function(add_git_submodule dir)

        # If git not found, it fill fire an error (since REQUIRED)
        find_package(Git REQUIRED)

        if(NOT EXISTS ${dir}/CMakeLists.txt)
            execute_process(COMMAND ${GIT_EXECUTABLE}
                submodule update --init --recursive -- ${dir}
                WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            )
        endif()

        add_subdirectory(${dir})
    endfunction(add_git_submodule)
    ```
    
3. In the root of project add cmake module path definition.

    ```bash
    set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
    include(AddGitSubmodule)

    add_git_submodule(external/json)
    ```
    
4. Call the lib from the main app
