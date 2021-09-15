#!/bin/bash

cd ..
make re > /dev/null 2>&1
make clean > /dev/null 2>&1
cd Tests/traces
rm -rf *
cd ..

TOTALERR=0
echo -e '\033[0mCheck that your programm Diplay Error when it is needed\n'
ERR=0
ARG="229 -13 2147483648"
RET=`../push_swap $ARG 2> ./traces/res_errors.txt`
RET2=`grep "Error" ./traces/res_errors.txt`
if [ "$RET2" != "Error" ];
	then
	((ERR++))
	((TOTALERR++))
fi

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail on over MAX_INT input\n"
fi

ERR=0
ARG="220 149 -2147483649"
RET=`../push_swap $ARG 2> ./traces/res_errors.txt`
RET2=`grep "Error" ./traces/res_errors.txt`
if [ "$RET2" != "Error" ];
	then
	((ERR++))
	((TOTALERR++))
fi

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail with under MIN_INT input\n"
fi

ERR=0
ARG="1 4 6 -156 2 1"
RET=`../push_swap $ARG 2> ./traces/res_errors.txt`
RET2=`grep "Error" ./traces/res_errors.txt`
if [ "$RET2" != "Error" ];
	then
	((ERR++))
	((TOTALERR++))
fi

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail with a double number input\n"
fi

ERR=0
ARG="1 2 3 4 5 6"
RET=`../push_swap $ARG > ./traces/res_errors.txt`
RET2=`cat ./traces/res_errors.txt | wc -l`
if [ "$RET2" != 0 ];
	then
	((ERR++))
	((TOTALERR++))
fi

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail with an already sorted stack\n"
fi


echo -e '\033[0mCheck validity and Getting an average for a stack of 3 random elements (250 op)\n'
ERR=0
TOTALERR=0
for i in range {1..249}
	do 
		ARG=`./genstack.pl 3 -2147483648 2147483647`
		echo $ARG >> ./traces/arg_3.txt
		RET=`../push_swap $ARG | wc -l >> ./traces/res_3.txt`
		RET2=`../push_swap $ARG | ../checker_linux $ARG`
		if [ "$RET2" != "OK" ];
			then
			((ERR++))
			((TOTALERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			echo $ARG >> ./traces/errors_3.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail $ERR / 250. Check ./traces/error_*.txt\n"
fi

echo -e '\033[0m\nCheck validity and Getting an average for a stack of 5 random elements (250 op)\n'
ERR=0
for i in range {1..249}
	do 
		ARG=`./genstack.pl 5 -2147483648 2147483647`
		echo $ARG >> ./traces/arg_5.txt
		RET=`../push_swap $ARG | wc -l >> ./traces/res_5.txt`
		RET2=`../push_swap $ARG | ../checker_linux $ARG`
		if [ "$RET2" != "OK" ];
			then
			((ERR++))
			((TOTALERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			echo $ARG >> ./traces/errors_5.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess'
else
	echo -e "\033[0;31m \nFail $ERR / 250. Check ./traces/error_*.txt"
fi

echo -e '\033[0m\nCheck validity and Getting an average for a stack of 100 random elements (250 op)\n'
ERR=0
for i in range {1..249}
	do 
		ARG=`./genstack.pl 100 -2147483648 2147483647`
		echo $ARG >> ./traces/arg_100.txt
		RET=`../push_swap $ARG | wc -l >> ./traces/res_100.txt`
		RET2=`../push_swap $ARG | ../checker_linux $ARG`
		if [ "$RET2" != "OK" ];
			then
			((ERR++))
			((TOTALERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			echo $ARG >> ./traces/errors_100.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail $ERR / 250. Check ./traces/error_*.txt\n"
fi

echo -e '\033[0m\nCheck validity and Getting an average for a stack of 500 random elements (250 op)\n'
ERR=0
for i in range {1..249}
	do 
		ARG=`./genstack.pl 500 -2147483648 2147483647`
		echo $ARG >> ./traces/arg_500.txt
		RET=`../push_swap $ARG | wc -l >> ./traces/res_500.txt`
		RET2=`../push_swap $ARG | ../checker_linux $ARG`
		if [ "$RET2" != "OK" ];
			then
			((ERR++))
			((TOTALERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			echo $ARG >> ./traces/errors_500.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done

if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \nSuccess\n'
else
	echo -e "\033[0;31m \nFail $ERR / 250. Check ./traces/error_*.txt\n"
fi

echo -e '\033[0m \nChecking leaks for (3)\n'
ERR=0
for i in range {1..10}
	do 
		ARG=`./genstack.pl 3 -2147483648 2147483647`
		RET=`valgrind ../push_swap $ARG 2> ./traces/valgrind.txt`
		RET2=`grep "All heap blocks were freed -- no leaks are possible" ./traces/valgrind.txt | awk '{$1=""}1'`
		if [ "$RET2" != " All heap blocks were freed -- no leaks are possible" ];
			then
			((ERR++))
			cat ./traces/valgrind.txt >> ./traces/valgrind_errors_3.txt
			echo -en '\033[0;31m▓\033[0;0m'
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done
rm -rf ./traces/valgrind.txt
echo -e '\033[0m \nChecking leaks for (5)\n'
for i in range {1..10}
	do 
		ARG=`./genstack.pl 5 -2147483648 2147483647`
		RET=`valgrind ../push_swap $ARG 2> ./traces/valgrind.txt`
		RET2=`grep "All heap blocks were freed -- no leaks are possible" ./traces/valgrind.txt | awk '{$1=""}1'`
		if [ "$RET2" != " All heap blocks were freed -- no leaks are possible" ];
			then
			((ERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			cat ./traces/valgrind.txt >> ./traces/valgrind_errors_5.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done
rm -rf ./traces/valgrind.txt
echo -e '\033[0m \nChecking leaks for (100)\n'
for i in range {1..10}
	do 
		ARG=`./genstack.pl 100 -2147483648 2147483647`
		RET=`valgrind ../push_swap $ARG 2> ./traces/valgrind.txt`
		RET2=`grep "All heap blocks were freed -- no leaks are possible" ./traces/valgrind.txt | awk '{$1=""}1'`
		if [ "$RET2" != " All heap blocks were freed -- no leaks are possible" ];
			then
			((ERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			cat ./traces/valgrind.txt >> ./traces/valgrind_errors_100.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done
rm -rf ./traces/valgrind.txt
echo -e '\033[0m \nChecking leaks for (500)\n'
for i in range {1..10}
	do 
		ARG=`./genstack.pl 500 -2147483648 2147483647`
		RET=`valgrind ../push_swap $ARG 2> ./traces/valgrind.txt`
		RET2=`grep "All heap blocks were freed -- no leaks are possible" ./traces/valgrind.txt | awk '{$1=""}1'`
		if [ "$RET2" != " All heap blocks were freed -- no leaks are possible" ];
			then
			((ERR++))
			echo -en '\033[0;31m▓\033[0;0m'
			cat ./traces/valgrind.txt >> ./traces/valgrind_errors_500.txt
		else
			echo -en '\033[0;32m▓\033[0;0m'
		fi
done
rm -rf ./traces/valgrind.txt
if [ $ERR -eq 0 ];
	then
	echo -e '\033[0;32m \n\nSuccess, no leaks !\033[0;0m'
else
	echo -e "\033[0;31m \n\nFail, you have leaks. Check traces/valgrind_errors_*.txt\033[0;0m"
fi
if [ $TOTALERR -eq 0 ];
	then
	./average ./traces/res_3.txt ./traces/res_5.txt ./traces/res_100.txt ./traces/res_500.txt 250 > ./traces/results
	cat ./traces/results
else
	echo -e "\033[0;31m \n\nFail, you have errors on your push_swap. Please, check traces/errors_*.txt\033[0;0m"
	echo -e "\033[0;31m \n\nResults are print when your pus_swap is perfect on the tests above. n\033[0;0m"
fi

