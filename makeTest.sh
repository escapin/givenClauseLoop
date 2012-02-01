#!/bin/bash
rm -rf $1_test.txt
java -jar givenClauseLoopBatch.jar -o -contr -time300 $1 	>> $1_test.txt
echo -n -e "\n##################################################################################\n\n" >> $1_test.txt
java -jar givenClauseLoopBatch.jar -o -exp -time300 $1 		>> $1_test.txt
echo -n -e "\n##################################################################################\n\n" >> $1_test.txt
java -jar givenClauseLoopBatch.jar -e -contr -time300 $1		>> $1_test.txt
echo -n -e "\n##################################################################################\n\n" >> $1_test.txt
java -jar givenClauseLoopBatch.jar -o -exp -time300 $1		>> $1_test.txt
echo -n -e "\n##################################################################################\n\n" >> $1_test.txt
