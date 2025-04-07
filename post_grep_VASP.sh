#for P in 0 10 20 30 40 50 ; do
#
#echo "#####################"
#for file in $( ls -1vd  T*/2-MD/vcopt_llm105_${P}_GPa*/run-*/VASP/VASP*/OUTCAR) ; do
#    ls $file
#    grep -e "in kB" $file
#done
#
#done

#for prefix in condensed_new_1 condensed_new_2 condensed_new_3 condensed_new_4  condensed_new1_1 condensed_new1_2 condensed_new1_3 condensed_new1_4 condensed_new1_5 condensed_new1_6 condensed_new2_1 condensed_new2_2 condensed_new2_3 condensed_new2_4 condensed_new2_5 condensed_new2_6 condensed_new3_1 condensed_new3_2 condensed_new3_3 condensed_new3_4 condensed_new3_5 condensed_new3_6 ; do
#    echo 
#    echo $prefix
#    for file in $(ls -1vd T*/2-MD/${prefix}/run-1/VASP/VASP_1/OUTCAR ) ; do
#        grep -e "in kB" $file
#    done
#done

for prefix in condensed_ambient_1 condensed_ambient_2 condensed_ambient_3 condensed_ambient_4 ; do
    echo 
    echo $prefix
    for file in $(ls -1vd T*/2-MD/${prefix}/run-1/VASP/VASP_*/OUTCAR ) ; do
        grep -e "in kB" $file
    done
done

