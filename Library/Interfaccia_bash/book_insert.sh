#! /bin/bash                                                                                                                                                                    
# Usage is source insert_book.sh "'Amleto'" "'11b'" "'William Shakespeare'"                                                                                                     
# NOTA BENE che ci sono sia " che ', altrimenti NON capisce un cazzo!!!!                                                                                                        
#                                                                                                                                                                               
#titolo="'Maigret e il produttore di vino'";                                                                                                                                    
#posizione="'11a'";                                                                                                                                                             
#autore="'george simenon'";                                                                                                                                                     

titolo=$1
posizione=$2
autore=$3

mysql -u root -pHannibal123 -e "set @title=${titolo}; set @pos=${posizione}; set @author=${autore}; source book_insert.sql;"
