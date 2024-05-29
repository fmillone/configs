
packages=("$@") 
for package in "${packages[@]}"; do
  echo "Stowing $package"
  stow -nv --adopt -t "$HOME" "$package" || exit 1
done

echo "Do you want to continue? (y/n)"
read -r answer
if [ "$answer" != "y" ]; then
  echo "Exiting..."
  exit 1
fi

for package in "${packages[@]}"; do
  stow -v --adopt -t "$HOME" "$package" || exit 1
done

