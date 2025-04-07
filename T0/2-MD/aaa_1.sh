for file in $(ls -1vd do_0_*.sh) ; do
    echo $file
    ./$file
done
