for i in $(seq 14 19) ; do
fold="T$i"
tar -cvzf ${fold}.tgz $fold
rm -rf $fold
done
