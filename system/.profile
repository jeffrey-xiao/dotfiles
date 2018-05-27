# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
