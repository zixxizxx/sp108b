# cov

```
guest@localhost:~/sp/code/c/10-os2linux/01-c/cov$ ./gcov.sh
gcc `pkg-config --cflags glib-2.0` -g -Wall -std=gnu99 -fprofile-arcs -ftest-coverage   -c -o keyval.o keyval.c
gcc `pkg-config --cflags glib-2.0` -g -Wall -std=gnu99 -fprofile-arcs -ftest-coverage   -c -o dict.o dict.c
gcc `pkg-config --cflags glib-2.0` -g -Wall -std=gnu99 -fprofile-arcs -ftest-coverage    dict_test.c keyval.o dict.o  
`pkg-config --libs glib-2.0` -o dict_test
/set1/new test: OK
/set1/copy test: OK
/set2/fail test: OK
File 'dict.c'
Lines executed:100.00% of 30
Creating 'dict.c.gcov'

File 'dict_test.c'
Lines executed:94.74% of 38
Creating 'dict_test.c.gcov'

File 'keyval.c'
Lines executed:100.00% of 11
Creating 'keyval.c.gcov'

dict_test.c.gcov-        -:   44:
dict_test.c.gcov-        1:   45:void test_failure(){
dict_test.c.gcov-        1:   46:    if (g_test_subprocess()){ //we are in the sub-test.
dict_test.c.gcov:    #####:   47:        dictionary *dd = dictionary_new();
dict_test.c.gcov:    #####:   48:        dictionary_add(dd, NULL, "blank");
dict_test.c.gcov-        -:   49:    }
dict_test.c.gcov-        1:   50:    g_test_trap_subprocess(NULL, 0, 0);
dict_test.c.gcov-        1:   51:    g_test_trap_assert_failed();
guest@localhost:~/sp/code/c/10-os2linux/01-c/cov$ ls
dict.automake  dict.gcda  dict.o       dict_test.c.gcov  dict_use.c  keyval.c.gcov  keyval.h
dict.c         dict.gcno  dict_test    dict_test.gcda    gcov.sh     keyval.gcda    keyval.o
dict.c.gcov    dict.h     dict_test.c  dict_test.gcno    keyval.c    keyval.gcno    makefile
```

