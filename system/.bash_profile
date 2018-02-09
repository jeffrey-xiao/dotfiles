# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"
