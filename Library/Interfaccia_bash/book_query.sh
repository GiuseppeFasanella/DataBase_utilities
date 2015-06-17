#! /bin/bash                                                                                                                                                                    
## wrapper bash script to execute mysql script with variables                                                                                                                   
## Run like this:  # runSQL.sh  "'Gabriele D\'Annunzio" "debug.txt"                                                                                                             

#To DO:                                                                                                                                                                         
## Passare il nome come "Gabriele D'Annunzio"                                                                                                                                   
## Se c'e' un ' metti \'                                                                                                                                                        
## Inserisci un ' dopo "                                                                                                                                                        

ARGS=2
if [ $# -ne "$ARGS" ]
then
 echo "you passed $# parameters"
exit
fi

nome=$1
output_file=$2

mysql -u root -ppassword -e "set @nome=${nome}; source book_query.sql;" >${output_file}
emacs -nw ${output_file}
