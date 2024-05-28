#!/bin/bash

open_ticket() {
    if [ -z "$1" ]; then
        read -p "Please enter the ticket number: " ticket_number
    else
        ticket_number="$1"
    fi

    git checkout -b "$ticket_number"
}

close_ticket() {
    ticket_number=$(git symbolic-ref --short HEAD)

    git add -A
    git commit -m "close $ticket_number"
}

merge_main() {
    if [ -z "$1" ]; then
        echo "Error: No target branch specified. Use: merge <target_branch>"
        exit 1
    fi

    current_branch=$(git symbolic-ref --short HEAD)

    git checkout "$1"
    git merge "$current_branch"
}

if [ "$1" == "open" ]; then
    open_ticket "$2"
elif [ "$1" == "close" ]; then
    close_ticket
elif [ "$1" == "merge" ]; then
    merge_main "$2"
else
    echo "Invalid command. Use 'open', 'close' or 'merge'."
fi
