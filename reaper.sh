
do_grim_reaping(){
echo "--- reaping $1 $2 ---"
find $1 -type f -name "$2" -mtime +$3 -exec /bin/rm -fv \{} \;
}

do_squishing(){
echo "--- squishing $1 $2 ---"
#for vbl in $(find $1 -name "$2" -mtime +$3 -print|grep -v \.gz  );do echo gzipping $vbl;gzip $vbl;done
find $1 -name "$2" -mtime +$3 -not -name "*.gz" -type f -printf "gzipping %p \n" -exec gzip \{} \;
}

. /usr/local/etc/reaper.ini
