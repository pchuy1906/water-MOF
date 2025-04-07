#!/bin/sh

module load python/3.12.2

src_chimes_lsq="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/"

exe="${src_chimes_lsq}/src/chimes_lsq.py"
python $exe --read_output True --algorithm dlasso &> ChIMES_params.txt

fileChIMESparam="ChIMES_params.txt"
exe="${src_chimes_lsq}/src/post_proc_lsq2.py"
python $exe $fileChIMESparam
mv ${fileChIMESparam}.reduced ${fileChIMESparam}

sed -i 's/FCUT TYPE: TERSOFF 0.95/FCUT TYPE: TERSOFF 0.95\n\nPAIR CHEBYSHEV PENALTY DIST: 0.30\nPAIR CHEBYSHEV PENALTY SCALING: 1.0E5\nPAIR CHEBYSHEV CUBIC SCALING: 1.0\n/g' ${fileChIMESparam}

for file in $(ls -1vd ../../T*/1-fit/${fileChIMESparam}) ; do
    echo
    echo $file
    grep num $file
done

paste  b.txt  Ax.txt  label.txt | awk '{printf "%15.9f %15.9f %s\n", $1, $2, $3}'  > data_fit.dat

for quant in force energy stress ; do
    grep -e "${quant}" data_fit.dat > data_${quant}.dat
done

~/tools/others/SCRIPTS/do_clean_ChIMES_LSQ.sh
