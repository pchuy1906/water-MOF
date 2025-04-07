file="traj.xyz"
ntail=`head -1 $file | awk '{print $1+2}'`
tail -$ntail $file > last.xyz

rm -rf molecule*.xyz
python ~/tools/Whole_Molecules/python/Single_Linkage.py --file_xyz last.xyz --rcut 1.2 --print_molecules 1  --cell_option cell_3 &> OUTPUT_molecules

nmol=`sort -nk1 cluster.txt  | tail -1`
rm -rf TMP_natom.dat
for i in $(seq 1 $nmol) ; do
    #echo $i
    nfile="molecule-${i}.xyz"
    natom=`head -1 $nfile | awk '{print $1}'`
    echo $i $natom >> TMP_natom.dat
done

echo "number of cluster $nmol"
sort -nk2 TMP_natom.dat  | head -3 | awk '{print $2}'
echo
sort -nk2 TMP_natom.dat  | tail -3 | awk '{print $2}'

sort -nk2 TMP_natom.dat  | tail -5 > TMP_natom_select.dat

echo
echo "usage: \"do_script.sh  1 \""
echo

if [ "$#" -ne 1 ]; then
  echo "unknown options. EXIT THE PROGRAM"
  exit 1
fi

ioption=$1

path_NEB_VASP="../../neb_@postfix@/run-1/VASP/"
rm -rf ${path_NEB_VASP}/LIST_STRUCTURE
if [ "$ioption" -eq 1 ]; then
    ncount=0

    while read line ; do
        id=`echo $line | awk '{print $1}'`
        natom=`echo $line | awk '{print $2}'`
        if [[ $natom -ge "3" ]] && [[ $natom -le "20" ]] ; then
            ncount=$(($ncount+1))
            echo $ncount $id
            cp molecule-${id}.xyz  ${path_NEB_VASP}/traj.xyz.${ncount}
            echo $ncount >> ${path_NEB_VASP}/LIST_STRUCTURE
        fi
    done < TMP_natom_select.dat
fi
rm -rf molecule*.xyz
