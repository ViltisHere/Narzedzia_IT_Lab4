#!/bin/bash
menu_options() {
    echo "Wybierz parametr:"
    echo "--date Pokazuje date."
    echo "--logs Tworzy podana ilosc plikow."
    echo "--help Wyswietli liste parametrow."
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
    --date)
        what_date
        ;;
    --logs)
        log_files ${2:-100}
        ;;
    --help)
        menu_options
        ;;
esac
