  GNU nano 7.2                                        CC.sh *                                          M     
#!/bin/bash 

##work with one file at the time from the intended dir. 


source_dir="/var/www/veljos.com/login/display/apis/db_apis/inbound/"
wk_file="/var/www/veljos.com/login/display/apis/db_apis/wk_file.txt"
cd "$source_dir"
ls > "$wk_file"

count=0
while IFW= read -r line
do
        count=$((count+1))
        [[ "$count" == "1" ]] && source_file="$line"
done < "$wk_file"
file_name="DB12"

source "$source_dir$source_file"
echo "$db_username"
echo "$platform_user"
echo "file from which to extract vales:$source_file"
