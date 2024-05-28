
# GitIssues

You know the drill: You're working on a project and constantly need to check out branches to work on tickets. Then commit, merge, another branch, another ticket. Either you endlessly click around in the UI or type away in the terminal. GitIssues is here to help.

## Features

- **open**: Creates a new branch for a ticket.
- **close**: Commits all changes and closes the ticket.
- **merge**: Merges the current branch into the specified target branch.

## Installation

1. Clone the repository:
   ```sh
   git clone <REPO-URL>
   ```

2. Navigate into the repository:
   ```sh
   cd <REPO-NAME>
   ```

3. Make the script executable:
   ```sh
   chmod +x gitissues.sh
   ```

## Make it globally executable

To run the script from anywhere, you have two options:

### 1. Add to PATH

Copy the script to a directory that's in your PATH, e.g., `/usr/local/bin`:
```sh
sudo cp gitissues.sh /usr/local/bin/gitissues
```

### 2. Create an alias

Add an alias to your `.bashrc`, `.zshrc`, or another shell configuration file:
```sh
echo 'alias gitissues="/path/to/script/gitissues.sh"' >> ~/.bashrc
source ~/.bashrc
```

Replace `/path/to/script` with the actual path to the script.

## Usage

### Open a new branch

Open a new branch for a ticket. If no ticket number is provided, you will be prompted to enter one:
```sh
gitissues open [ticketnumber]
```

### Close a branch

Add all changes, commit them, and close the branch:
```sh
gitissues close
```

### Merge a branch into main

Merge the current branch into the specified target branch. Provide the target branch as an argument:
```sh
gitissues merge <targetbranch>
```

## Examples

### Open a new branch without providing a ticket number
```sh
gitissues open
```
You will be prompted to enter a ticket number.

### Open a new branch with a ticket number
```sh
gitissues open 1234
```

### Close a branch
```sh
gitissues close
```

### Merge a branch into main
```sh
gitissues merge main
```

## Error handling

- If no target branch is provided with `merge`, an error message will appear:
  ```sh
  Error: No target branch specified. Use: merge <targetbranch>
  ```

## License

This project is licensed under the [MIT License](LICENSE).

---

Enjoy more efficient Git workflows! If you have questions or suggestions, just open an issue.
