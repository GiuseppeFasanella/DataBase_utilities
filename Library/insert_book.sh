#! /bin/bash        
#This script calls a sql script and its only purpose is to pass the arguments I need to mySQL.
#All the rest is done via book_insert.sql
#This is just a "setter" and a "wrapper"

#NOTA BENE che ci sono sia " che ', altrimenti NON capisce un cazzo!!!!                                                                                                         
#SCRIVERE UNO USAGE CHIARO< ALTRIMENTI UNA COSA DEL GENERE ME LA SCORDO SICUROOOOO                                                                                              
titolo="'Maigret e il produttore di vino'";
posizione="'11a'";
autore="'george simenon'";

mysql -u root -ppassword -e "set @title=${titolo}; set @pos=${posizione}; set @author=${autore}; source book_insert.sql;"
