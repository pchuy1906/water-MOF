echo
echo "usage: \"do_script.sh  force/energy/stress  \""
echo

if [ "$#" -ne 1 ]; then
  echo "unknown options. EXIT THE PROGRAM"
  exit 1
fi

quant="$1"
file="data_${quant}.dat"

xmin=-12000
xmax=12000

echo "$xmin $xmin" >  corr_line.dat
echo "$xmax $xmax" >> corr_line.dat


cp ~/tools/XMGRACE/bfile_compare_energy  bfile_compare_energy

cwd=`pwd`

file1="$cwd/$file"

tcurr=${file1//\// }
fcurr=`echo "$tcurr" | awk '{print $(NF-2)}'`
ncurr=${fcurr/T/}


echo $file1
#echo $fcurr
#echo $ncurr
nlast=$(($ncurr-1))
file2="../../T${nlast}/1-fit/$file"
echo $file2

sed -i "s:@file1@:$file1:g" bfile_compare_energy
sed -i "s:@file2@:$file2:g" bfile_compare_energy

xmgrace -batch bfile_compare_energy

rm -rf bfile_compare_energy  corr_line.dat
