
#======================================================================================
# Functions
# 参考: https://github.com/yutkat/dotfiles/blob/master/.config/zsh/rc/function.zsh
#======================================================================================

function 256color() {
  for code in {000..255}; do
    print -nP -- "%F{$code}$code %f";
    if [ $((${code} % 16)) -eq 15 ]; then
      echo ""
    fi
  done
}

function ascii_color_code() {
  seq 30 47 | xargs -n 1 -i{} printf "\x1b[%dm#\x1b[0m %d\n" {} {}
}

function find_no_new_line_at_end_of_file() {
  find * -type f -print0 | xargs -0 -L1 bash -c 'test "$(tail -c 1 "$0")" && echo "No new line at end of $0"'
}
