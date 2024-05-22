#!/bin/bash
menu_options() {
    echo "Wybierz parametr:"
    echo "--date"
}

what_date() {
    date
}

case "$1" in
    --date)
        what_date
        ;;
esac
