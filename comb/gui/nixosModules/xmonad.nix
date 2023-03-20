{ inputs, cell, config, lib, pkgs, ... }:

let
  countdown = pkgs.writeShellScriptBin "countdown" ''
    #!/usr/bin/env bash
    today=`echo $(($(date --utc --date "$1" +%s)/86400))`
    target=`echo $(($(date --utc --date "Apr 8 2078" +%s)/86400))`
    days=`expr $target - $today`
    echo "$days"
  '';

  system_keybinds = pkgs.writeShellScriptBin "system-keybinds" ''
    #!/usr/bin/env bash
    sed -n '/START_KEYS/,/END_KEYS/p' ~/.xmonad/xmonad.hs | \
        grep -e ', ("' \
            -e '\[ (' \
            -e 'KB_GROUP' | \
            grep -v '\-\- , ("' | \
             sed -e 's/^[ \t]*//' \
             -e 's/, (/(/' \
               -e 's/\[ (/(/' \
               -e 's/-- KB_GROUP /\n/' \
               -e 's/", /"\t: /' | \
               yad --text-info --back=#282828 --fore=#ebdbb2 --geometry=1200x800 --no-buttons --undecorated --close-on-unfocus --borders=0 --splash --escape-ok --margins=0
  '';

  caffeinated = pkgs.writeShellScriptBin "caffeinated" ''
    #!/usr/bin/env bash
    result=$(ps aux | grep "caffeine-ng" | grep -v "grep")
    if [[ "$result" != "" ]]; then
        echo $(echo -e '\uf675')
     else
        echo $(echo -e '\ufbc8')
     fi
  '';

  drink-coffee = pkgs.writeShellScriptBin "drink-coffee" ''
    #!/usr/bin/env bash
    result=$(ps aux | grep "caffeine-ng" | grep -v "grep")
    if [[ "$result" != "" ]]; then
            caffeine kill
    else
            caffeine start &
    fi
  '';

  get_volume = pkgs.writeShellScriptBin "get_volume" ''
    #!/usr/bin/env bash
      vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)
      echo Vol: $vol%
      exit 0
  '';

in
{
  services.xserver = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
  environment.systemPackages = [ countdown system_keybinds caffeinated drink-coffee get_volume ];
}
