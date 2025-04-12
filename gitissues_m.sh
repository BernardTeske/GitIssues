#!/bin/bash

open_ticket() {
    if [ -z "$1" ]; then
        read -p "Please enter the ticket number: " ticket_number
    else
        ticket_number="$1"
    fi

    git checkout -b "$ticket_number"
}

push_ticket() {
    ticket_number=$(git symbolic-ref --short HEAD)
    git push origin "$ticket_number"
}

close_ticket() {
    ticket_number=$(git symbolic-ref --short HEAD)

    git add -A
    git commit -m "fix: $ticket_number"
    git push origin "$ticket_number"
    git checkout next
    git branch -d "$ticket_number"
}

merge_main() {
    echo "Dödöm: No merging in this Project!"
}

if [ "$1" == "open" ]; then
    open_ticket "$2"
elif [ "$1" == "push" ]; then
    push_ticket "$2"
elif [ "$1" == "close" ]; then
    close_ticket
elif [ "$1" == "merge" ]; then
    merge_main "$2"
else
    echo "Invalid command. Use 'open', 'close' or 'merge'."
fi
