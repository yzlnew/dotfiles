CODE_DIR="/Users/robin/Library/Application Support/Code/User/snippets"
for i in ~/dotfiles/Snippets/*.snippets; do
    convert-snippets $i $CODE_DIR/"$(basename $i .snippets).json"
done
