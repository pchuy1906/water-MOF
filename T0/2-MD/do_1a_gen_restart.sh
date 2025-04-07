for prefix in condensed ; do
    cwd=`pwd`
    for fold in $(ls -1vd ${prefix}*) ; do
        cd $fold
            pwd
            ../../../scripts/do_make_restart_LMP.sh
        cd $cwd
    done
done
