In order to run as mode process

``` bash
$ cmake -P CMakeLists.txt
```

<sub>*Table 1: Matrix string vs list*</sub>

   | Question           | Value of VAR |message(${VAR}) | message("${VAR}")  | 
   | :---               |     :---:    |    :---:       |  :---:             | 
   | set(VAR aa bb cc)  | aa;bb;cc     |aabbcc          |aa;bb;cc            | 
   | set(VAR aa;bb;cc)  | aa;bb;cc     |aabbcc          |aa;bb;cc            | 
   | set(VAR "aa" "bb" "cc")  | aa;bb;cc     |aabbcc          |aa;bb;cc            | 
   | set(VAR "aa bb cc")  | aa bb cc     |aa bb cc          |aa bb cc            | 
   | set(VAR "aa;bb;cc")  | aa;bb;cc     |aabbcc          |aa;bb;cc            | 
   
   
   