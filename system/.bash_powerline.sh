#!/usr/bin/env bash

__powerline() {
  ps1() {
    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.
    if [ $? -eq 0 ]; then
      local BG_EXIT="$BG_GREEN"
      local FG_EXIT="$FG_GREEN"
    else
      local BG_EXIT="$BG_RED"
      local FG_EXIT="$FG_RED"
    fi

    __powerline_git_info=" $(__git_info)"

    if [[ -z "${__powerline_git_info// }" ]]; then
      PS1="$BG_BASE1$FG_BASE3 \W $RESET$BG_EXIT$FG_BASE1$RIGHT_ARROW$RESET"
    else
      PS1="$BG_BASE1$FG_BASE3 \W $RESET$BG_BLUE$FG_BASE1$RIGHT_ARROW$RESET"
      PS1+="$BG_BLUE$FG_BASE3\${__powerline_git_info} $RESET$BG_EXIT$FG_BLUE$RIGHT_ARROW$RESET"
    fi
    PS1+="$BG_EXIT$FG_BASE3 $PS_SYMBOL $RESET$FG_EXIT$RIGHT_ARROW$RESET "
  }
  source ~/.bash_symbols.sh
  source ~/.bash_colors.sh
  source ~/.bash_info.sh
  PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
