module load python/3.12.2

    echo "###########################"
    echo "current-files-condensed"
    filexyz="SCAN_condensed_current.xyz"
    python ~/tools/others/export_xyzfes.py --file_xyz ${filexyz} &> OOO
    mv reference_force_stress_energy.dat reference_force_stress_energy_1.dat
    grep ENERGY reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_energy_1.dat
    grep FORCE  reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_force_1.dat
    echo "energy"
    head -n 1 sorted_energy_1.dat
    tail -n 1 sorted_energy_1.dat 
    echo "force"
    head -n 1 sorted_force_1.dat
    tail -n 1 sorted_force_1.dat

    echo "addition-files-condensed"
    filexyz="SCAN_condensed_add.xyz"
    python ~/tools/others/export_xyzfes.py --file_xyz ${filexyz} &> OOO
    mv reference_force_stress_energy.dat reference_force_stress_energy_2.dat
    grep ENERGY reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_energy_2.dat
    grep FORCE  reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_force_2.dat
    echo "energy"
    head -n 1 sorted_energy_2.dat
    tail -n 1 sorted_energy_2.dat 
    echo "force"
    head -n 1 sorted_force_2.dat
    tail -n 1 sorted_force_2.dat

#    echo "###########################"
#    echo "current-files-gas"
#    filexyz="SCAN_gas_current.xyz"
#    python ~/tools/others/export_xyzfes.py --file_xyz ${filexyz} &> OOO
#    mv reference_force_stress_energy.dat reference_force_stress_energy_1.dat
#    grep ENERGY reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_energy_1.dat
#    grep FORCE  reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_force_1.dat
#    echo "energy"
#    head -n 1 sorted_energy_1.dat
#    tail -n 1 sorted_energy_1.dat
#    echo "force"
#    head -n 1 sorted_force_1.dat
#    tail -n 1 sorted_force_1.dat
#
#    echo "addition-files-gas"
#    filexyz="SCAN_gas_add.xyz"
#    python ~/tools/others/export_xyzfes.py --file_xyz ${filexyz} &> OOO
#    mv reference_force_stress_energy.dat reference_force_stress_energy_2.dat
#    grep ENERGY reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_energy_2.dat
#    grep FORCE  reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_force_2.dat
#    echo "energy"
#    head -n 1 sorted_energy_2.dat
#    tail -n 1 sorted_energy_2.dat
#    echo "force"
#    head -n 1 sorted_force_2.dat
#    tail -n 1 sorted_force_2.dat

#    ./check_current_addition_condensed.sh SCAN_condensed_current.xyz 1 &> OOO
#    grep ENERGY reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_energy_1.dat
#    grep FORCE  reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_force_1.dat
#    head -n 1 sorted_energy_1.dat sorted_force_1.dat
#    tail -n 1 sorted_energy_1.dat sorted_force_1.dat
#    echo
#    echo
#    echo "addition-files-condensed"
#    ./check_current_addition_condensed.sh SCAN_condensed_add.xyz 2 &> OOO
#    grep ENERGY reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_energy_2.dat
#    grep FORCE  reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_force_2.dat
#    head -n 1 sorted_energy_2.dat sorted_force_2.dat
#    tail -n 1 sorted_energy_2.dat sorted_force_2.dat
#
#    echo "###########################"
#    echo "current-files-gas"
#    ./check_current_addition_gas.sh SCAN_gas_current.xyz 1 &> OOO
#    grep ENERGY reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_energy_1.dat
#    grep FORCE  reference_force_stress_energy_1.dat  | sort  -nk1 > sorted_force_1.dat
#    head -n 1 sorted_energy_1.dat sorted_force_1.dat
#    tail -n 1 sorted_energy_1.dat sorted_force_1.dat
#    echo
#    echo
#    echo "addition-files-gas"
#    ./check_current_addition_gas.sh SCAN_gas_add.xyz 2 &> OOO
#    grep ENERGY reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_energy_2.dat
#    grep FORCE  reference_force_stress_energy_2.dat  | sort  -nk1 > sorted_force_2.dat
#    head -n 1 sorted_energy_2.dat sorted_force_2.dat
#    tail -n 1 sorted_energy_2.dat sorted_force_2.dat
#
