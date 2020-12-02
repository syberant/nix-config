{ lib, writeScriptBin, coreutils, fzf, st, gnused, bash }:

writeScriptBin "fzfmenu" ''
  #!/usr/bin/env bash
  # fzfmenu - fzf as dmenu replacement

  PATH=${lib.makeBinPath [ coreutils fzf st gnused bash ]}

  # fifos are here to not wait for end of input
  # (useful for e.g. find $HOME | fzfmenu ...)
  input=$(mktemp -u --suffix .fzfmenu.input)
  output=$(mktemp -u --suffix .fzfmenu.output)
  mkfifo $input
  mkfifo $output
  chmod 600 $input $output

  # it's better to use st here (starts a lot faster than pretty much everything else)
  # the ugly printf | sed thing is here to make args with quotes work.
  # (e.g. --preview='echo {1}').
  # sadly we can't use "$@" here directly because we are inside sh -c "..." call
  # already.
  # you can also set window dimensions via -g '=COLSxROWS', see man st.

  # TODO: fixme
  # st -c fzfmenu -n fzfmenu -e sh -c "cat $input | fzf $(printf -- " '%s'" "$@" | sed "s/^ $//") | tee $output" & disown
  st -c fzfmenu -n fzfmenu -e sh -c "cat $input | fzf | tee $output" & disown

  # handle ctrl+c outside child terminal window
  trap "kill $! 2>/dev/null; rm -f $input $output" EXIT

  cat > $input
  cat $output
''
