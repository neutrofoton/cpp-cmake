There are 3 ways to update/modify cache variables:
1. Edit CMakeCache.txt file => manual
2. Use FORCE keyword => not recommended
3. use -D flag => recommended
    ``` bash
    $ cmake -DVariableName=xxxx
    ```
    example

    ``` bash
    $ cmake -DName=hello
    ```

if FORCE keyword and -D flag both are used, FORCE keyword has the highest priority.