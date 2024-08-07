packages=("$@")
for package in "${packages[@]}"; do
  echo "Stowing $package"
  stow -nv -t "$HOME" "$package" || exit 1
done

echo "Do you want to continue? (y/n)"
read -r answer
if [ "$answer" != "y" ]; then
  echo "Exiting..."
  exit 1
fi

for package in "${packages[@]}"; do
  stow -v -t "$HOME" "$package" || exit 1
  if [ -f "$package/installscript.sh" ]; then
    echo "Running postinstall.sh for $package"
    bash "$package/installscript.sh" || exit 1
  fi
done
