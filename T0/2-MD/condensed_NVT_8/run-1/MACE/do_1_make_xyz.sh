filename="../traj.xyz"
nline=`head -1 $filename | awk '{print $1+2}'`

nfile=`wc $filename | awk '{print $1/'"$nline"'}'`

echo "Spliting file $filename"

for ifile in `cat LIST_STRUCTURE` ; do
  line_begin=$((1+$nline*($ifile-1)))
  line_end=$(($nline+$nline*($ifile-1)))
  sed -n ${line_begin},${line_end}p  ${filename} > ${filename}.${ifile}
  echo $ifile ${line_begin} ${line_end}
done

mv ${filename}.* .
