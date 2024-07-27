  GNU nano 7.2                                        CC.sh *                                          M     
#!/bin/bash 

##work with one file at the time from the intended dir. 
#we can recall this at the end of the original service, so this will stopp till there is no remaining apis to add or context we are at
original_dir="/var/www/veljos.com/login/display/apis/db_apis/"
cd "$original_dir"
[ -f "wk_file.txt" ] || touch "wk_file.txt"
source_dir="/var/www/veljos.com/login/display/apis/db_apis/inbound/"
wk_file="/var/www/veljos.com/login/display/apis/db_apis/wk_file.txt"
cd "$source_dir"
ls -althr > "$wk_file"
##here will only read a file at a time , 
count=0
while IFW= read -r line
do
        count=$((count+1))
        if [ "$count" == "1" ]
         then
                if [[ ${#line} -gt 2 ]]
                 then
                        echo "api detected properly, apis from $line $(date)" >> "logs_file"
                        source_file="$line"
                        break
                else
                        echo "not any name on the file dettectd, will stop query: content: $line, date:$(date)" >> "/var/logs/new_user_logs.txt"
                        ##supposing you want to stop the whole query
                        exit
                fi
        fi
done < "$wk_file"
rm "$source_file"
cd "$original_dir"
rm "$wk_file"
[[ "$count" -eq 0 ]] && exit
