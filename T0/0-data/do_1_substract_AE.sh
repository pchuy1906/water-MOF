fileAE="AE_compute.dat"

module load python/3.12.2

fileXYZ_condensed="SCAN_condensed.xyz"
python ~/tools/others/subtract_atomic_xyzfe.py \
  --file_xyz           ${fileXYZ_condensed} \
  --file_atomic_energy ${fileAE} \
  --cell_type           NON_ORTHO 

#fileXYZ_gas="SCAN_gas.xyz"
#python ~/tools/others/subtract_atomic_xyzfe.py \
#  --file_xyz           ${fileXYZ_gas} \
#  --file_atomic_energy ${fileAE} \
#  --cell_type           NON_ORTHO 

cat subtract_atomic_energy_${fileXYZ_condensed} subtract_atomic_energy_${fileXYZ_gas} > subtract_atomic_energy_all.xyz
