#!/bin/bash

# Funktion für das Öffnen eines neuen Branches
open_ticket() {
    # Frage nach der Ticketnummer
    read -p "Bitte die Ticketnummer eingeben: " ticketnummer

    # Erstelle den neuen Branch mit dem Namen "ticketname"
    git checkout -b "$ticketnummer"
}

# Funktion für das Schließen eines Branches
close_ticket() {
    # Hole den Namen des aktuellen Branches
    ticketnummer=$(git symbolic-ref --short HEAD)

    # Füge alle Änderungen hinzu, committe sie und schließe das Ticket
    git add -A
    git commit -m "close $ticketnummer"
}

# Funktion für das Mergen eines Branches in main
merge_main() {
    # Hole den Namen des aktuellen Branches
    current_branch=$(git symbolic-ref --short HEAD)

    # Wechsel zu main und merge den aktuellen Branch
    git checkout "$1"
    git merge "$current_branch"
}

# Prüfen, welcher Befehl übergeben wurde
if [ "$1" == "open" ]; then
    open_ticket
elif [ "$1" == "close" ]; then
    close_ticket
elif [ "$1" == "merge" ]; then
    merge_main "$2"
else
    echo "Ungültiger Befehl. Verwende 'open', 'close' oder 'merge'."
fi
