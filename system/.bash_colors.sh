: <<'solarized color scheme'
if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
  readonly FG_BASE03="\[$(tput setaf 234)\]"
  readonly FG_BASE02="\[$(tput setaf 235)\]"
  readonly FG_BASE01="\[$(tput setaf 240)\]"
  readonly FG_BASE00="\[$(tput setaf 241)\]"
  readonly FG_BASE0="\[$(tput setaf 244)\]"
  readonly FG_BASE1="\[$(tput setaf 245)\]"
  readonly FG_BASE2="\[$(tput setaf 254)\]"
  readonly FG_BASE3="\[$(tput setaf 230)\]"
  readonly BG_BASE03="\[$(tput setab 234)\]"
  readonly BG_BASE02="\[$(tput setab 235)\]"
  readonly BG_BASE01="\[$(tput setab 240)\]"
  readonly BG_BASE00="\[$(tput setab 241)\]"
  readonly BG_BASE0="\[$(tput setab 244)\]"
  readonly BG_BASE1="\[$(tput setab 245)\]"
  readonly BG_BASE2="\[$(tput setab 254)\]"
  readonly BG_BASE3="\[$(tput setab 230)\]"

  readonly FG_YELLOW="\[$(tput setaf 136)\]"
  readonly FG_ORANGE="\[$(tput setaf 166)\]"
  readonly FG_RED="\[$(tput setaf 160)\]"
  readonly FG_MAGENTA="\[$(tput setaf 125)\]"
  readonly FG_VIOLET="\[$(tput setaf 61)\]"
  readonly FG_BLUE="\[$(tput setaf 33)\]"
  readonly FG_CYAN="\[$(tput setaf 37)\]"
  readonly FG_GREEN="\[$(tput setaf 64)\]"

  readonly BG_YELLOW="\[$(tput setab 136)\]"
  readonly BG_ORANGE="\[$(tput setab 166)\]"
  readonly BG_RED="\[$(tput setab 160)\]"
  readonly BG_MAGENTA="\[$(tput setab 125)\]"
  readonly BG_VIOLET="\[$(tput setab 61)\]"
  readonly BG_BLUE="\[$(tput setab 33)\]"
  readonly BG_CYAN="\[$(tput setab 37)\]"
  readonly BG_GREEN="\[$(tput setab 64)\]"
fi
solarized color scheme

__initialize_colors() {
  [[ -n $COLORS_INITIALIZED ]] && return
  readonly COLORS_INITIALIZED=1

  readonly FG_BASE03="\[$(tput setaf 8)\]"
  readonly FG_BASE02="\[$(tput setaf 0)\]"
  readonly FG_BASE01="\[$(tput setaf 10)\]"
  readonly FG_BASE00="\[$(tput setaf 11)\]"
  readonly FG_BASE0="\[$(tput setaf 12)\]"
  readonly FG_BASE1="\[$(tput setaf 14)\]"
  readonly FG_BASE2="\[$(tput setaf 7)\]"
  readonly FG_BASE3="\[$(tput setaf 15)\]"

  readonly BG_BASE03="\[$(tput setab 8)\]"
  readonly BG_BASE02="\[$(tput setab 0)\]"
  readonly BG_BASE01="\[$(tput setab 10)\]"
  readonly BG_BASE00="\[$(tput setab 11)\]"
  readonly BG_BASE0="\[$(tput setab 12)\]"
  readonly BG_BASE1="\[$(tput setab 14)\]"
  readonly BG_BASE2="\[$(tput setab 7)\]"
  readonly BG_BASE3="\[$(tput setab 15)\]"

  readonly FG_YELLOW="\[$(tput setaf 3)\]"
  readonly FG_ORANGE="\[$(tput setaf 9)\]"
  readonly FG_RED="\[$(tput setaf 1)\]"
  readonly FG_MAGENTA="\[$(tput setaf 5)\]"
  readonly FG_VIOLET="\[$(tput setaf 13)\]"
  readonly FG_BLUE="\[$(tput setaf 4)\]"
  readonly FG_CYAN="\[$(tput setaf 6)\]"
  readonly FG_GREEN="\[$(tput setaf 2)\]"

  readonly BG_YELLOW="\[$(tput setab 3)\]"
  readonly BG_ORANGE="\[$(tput setab 9)\]"
  readonly BG_RED="\[$(tput setab 1)\]"
  readonly BG_MAGENTA="\[$(tput setab 5)\]"
  readonly BG_VIOLET="\[$(tput setab 13)\]"
  readonly BG_BLUE="\[$(tput setab 4)\]"
  readonly BG_CYAN="\[$(tput setab 6)\]"
  readonly BG_GREEN="\[$(tput setab 2)\]"

  readonly DIM="\[$(tput dim)\]"
  readonly REVERSE="\[$(tput rev)\]"
  readonly RESET="\[$(tput sgr0)\]"
  readonly BOLD="\[$(tput bold)\]"
}

__initialize_colors
unset __initialize_colors
