cwd=`pwd`

for fold in $(ls -1vd */run*/MACE) ; do
    cd $fold
        pwd
        ./do_1_make_xyz.sh
        ./do_2_make_POSCAR.sh
        ./do_3_run_collect_MACE.sh

        python ~/tools/others/xyz_2_lammps.py \
          --file_xyz  MACE.xyzf \
          --atom_type Al C H N O \
          --atom_mass 26.982 12.011 1.008 14.007 15.999 \
          --cell_type NON_ORTHO \
          --use_molecule_id   1 \
          --triclinic_cell

        ls
    cd $cwd
done
