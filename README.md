# push_swap_simple_test
A simple push_swap tester

How to use it ?

1) Clone the repo on your repo containing push_swap.
2) bash test.sh
3) Don't forget to allow the execution of the script : chmod 777 test.sh

TESTED ON LINUX UBUNTU ONLY

What you wan expect about this tester.

The tester is certainly full of bugs, but it tests the simples use cases (min int, max int, double, and sorted stack) and other cases for stack of 3, 5, 100, 500 elements. It makes an average for theses tests and display the result if everything was ok with the checker.

It also display the min moves made by the programm, and count how many time the programm did his work under a certain limits (based on the correction).

It checks if there is leaks with valgrind.

If a test fails, you can check wich values caused the fail on the traces directory. There is one file per / error / stack size.

That's all. The test is certainly not complete, feel free to change the code, download and made your own !

A part of the work was already made by jgoncalv and another one that I forgot the name. Sorry !


![alt text](https://i.ibb.co/nnw9V22/Capture-d-cran-de-2021-09-15-14-53-27.png)

![alt text](https://i.ibb.co/TBDPdJ4/Capture-d-cran-de-2021-09-15-14-54-52.png)

![alt text](https://i.ibb.co/9yNr9ht/Capture-d-cran-de-2021-09-15-14-54-58.png)
