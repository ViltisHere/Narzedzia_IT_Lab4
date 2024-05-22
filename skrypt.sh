#!/bin/bash
menu_options() {
    echo "Wybierz parametr:"
    echo "--date/-d Pokazuje date."
    echo "--logs/-l Tworzy podana ilosc plikow."
    echo "--help/-h Wyswietli liste parametrow."
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
esac
