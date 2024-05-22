#!/bin/bash
menu_options() {
    echo "Wybierz parametr:"
    echo "--date/-d Pokazuje date."
    echo "--logs/-l Tworzy podana ilosc plikow log."
    echo "--help/-h Wyswietli liste parametrow."
    echo "--init/-i Sklonuje repozytorium."
    echo "--error/-e Tworzenie podana ilosc plików error."
}

what_date() {
    date
}

log_files() {
    local files=${1:-100}
    for i in $(seq 1 $files); do
        filename="log${i}.txt"
	echo "Plik: $filename" > $filename
	echo "Skrypt: $0" >> $filename
	echo "Data: $(date)" >> $filename
    done
}

error_files() {
    local files=${1:-100}
    mkdir -p error
    for i in $(seq 1 $files); do
        filename="error/error${i}.txt"
	echo "Plik: $filename" > $filenama
        echo "Skrypt: $0" >> $filename
        echo "Data: $(date)" >> $filename
    done
}

clone_repository() {
    git clone https://github.com/ViltisHere/Narzedzia_IT_Lab4.git
    export PATH=$(pwd):$PATH
}
case "$1" in
    --date|-d)
        what_date
        ;;
    --logs|-l)
        log_files ${2:-100}
        ;;
    --help|-h)
        menu_options
        ;;
    --init|-i)
        clone_repository
        ;;
    --error|-e)
        error_files
        ;;
    *)
        echo"Błędna opcja"
	menu_options
	exit 1
	;;
esac
