
if [ -d ~/.vim_runtime ]; then
    echo "already installed. nothing to do"
    exit 0
fi

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime || exit 1

sh ~/.vim_runtime/install_awesome_vimrc.sh || exit 1

