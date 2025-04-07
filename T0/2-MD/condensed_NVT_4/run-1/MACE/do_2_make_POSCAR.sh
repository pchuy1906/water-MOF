rm -rf OUTPUT_XYZ_2_POSCAR
for ID in `cat LIST_STRUCTURE` ; do

    echo $ID
    python ~/tools/others/xyz_2_POSCAR.py --file_xyz traj.xyz.${ID}  --cell_type cell_9 &> TMP
    cat TMP
    cat TMP >> OUTPUT_XYZ_2_POSCAR

    fold="MACE_$ID"
    mkdir $fold
    mv POSCAR $fold

done
