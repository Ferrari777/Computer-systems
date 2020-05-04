#!/bin/bash
                                                                                 
pathToPrgrm="/home/grid/testbed/tb417/Lab3/gccProgram/"
cd $pathToPrgrm
flagsForCmplrOptmztion=(O0 O1 O2 O3 Os Ofast)
i=0
                                                                                 
for flag in ${flagsForCmplrOptmztion[@]}
do
        echo "g++ compilation with $flag flag:"
        srcfile="result$i"
        g++ -$flag program.cpp -o $srcfile -lm
        time ./$srcfile
        let "i=i+1"
        echo -e "\n"
done
                                                                                 
ml icc                                                                           
flagsForIccCpu=$(cat /proc/cpuinfo | grep flags | cut -d: -f2 | uniq)
flagsForIccOptmztion=(O2 Ofast)
i=0


for optmzFlag in ${flagsForIccOptmztion[@]}
do
        for iccFlag in $flagsForIccCpu
        do
                srcfile="iccResult$iccFlag"
                icc -$optmzFlag -qopt-report-phase=vec program.cpp -o $srcfile -l
m -x$iccFlag 2> errors.txt
                if [ $? -eq 0 ]
                then
                        echo "icc compilation with -$optmzFlag flag and $iccFlag 
cpu extension:"
                        time ./$srcfile
                        echo -e "\n"
                fi
        done
done