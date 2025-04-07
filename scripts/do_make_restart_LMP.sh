nrun=`ls -d run* | wc | awk '{print $1}'`
oldrun="run-$nrun"
newrun="run-$(($nrun+1))"
echo $oldrun $newrun
mkdir $newrun
cp run-1/in.lammps   $newrun
mv $oldrun/MACE      $newrun
sed -i 's|.*read_data.*|read_restart     ../'${oldrun}'/restart.b|g' $newrun/in.lammps
sed -i 's|velocity|#velocity|g' $newrun/in.lammps

