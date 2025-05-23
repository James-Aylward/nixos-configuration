{ pkgs }:

pkgs.writeShellScriptBin "switch" ''
  windows=$(${pkgs.wmctrl}/bin/wmctrl -xl | tr -s '[:blank:]' | cut -d ' ' -f 3-3,5- | sed 's/^[a-zA-Z0-9-]*\.//' | sort | uniq)

  # Add spaces to align the WM_NAMEs of the windows
  max=$(echo "$windows" | awk '{cur=length($1); max=(cur>max?cur:max)} END{print max}')

  windows=$(echo "$windows" | \
                awk -v max="$max" \
                    '{cur=length($1); printf $1; \
                      for(i=0; i < max - cur + 1; i++) printf " "; \
                      $1 = ""; printf "%s\n", $0}')


  target=$(echo "$windows" | dmenu --sb \#fc7e18 \
                                   --nb \#282828 \
                                   --nf \#bbbbbb \
                                   --sf \#eeeeee \
                                   -l 10 -i -p switch: | tr -s '[:blank:]' | cut -d ' ' -f 2-)

  if [[ -n $target ]]; then
      ${pkgs.wmctrl}/bin/wmctrl -a "$target"
  fi
''

