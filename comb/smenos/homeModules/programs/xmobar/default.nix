{ config, nixosConfig, ... }:

{
  programs.xmobar = {
    enable = true;
    extraConfig = ''
       Config { font = "xft:SauceCode Pro Nerd Font:weight=bold:pixelsize=12:antialias=true:hinting=true"
      --, additionalFonts = [ "xft:Mononoki Nerd Font:pixelsize=11:weight=bold:antialias=true:hinting=true" ]
      , borderColor = "black"
      , border = TopB
      , bgColor = "#${config.colorScheme.colors.base00}"
      , fgColor = "#${config.colorScheme.colors.base04}"
      , alpha = 255
      , position = Top
      , textOffset = -1
      , iconOffset = -1
      , lowerOnStart = True
      , pickBroadest = False
      , persistent = True
      , hideOnStart = False
      , iconRoot = "."
      , allDesktops = True
      , overrideRedirect = True
      , commands = [
                     Run Network "${
                       builtins.elemAt
                       nixosConfig.networking.wireless.interfaces 0
                     }" ["-t", "\xf0aa <tx>kb \xf0ab <rx>kb"] 20
                   , Run Cpu ["-t","\xe266 <total>%",
                              "-L","3","-H","80",
                              "--normal","green","--high","red"] 10
                   , Run Memory ["-t","\xf1c0 <usedratio>%"] 10
                   , Run Swap [] 10
                   , Run Com "uname" ["-s","-r"] "" 36000
                   , Run Com "echo" ["\xf313"] "os" 3600
                   , Run Com "bash" ["-c", "caffeinated"] "caff" 10
                   , Run Com "bash" ["-c", "get_volume"] "myvolume" 10
                   , Run Com "bash" ["-c", "countdown"] "life" 36000
                   , Run Kbd [("us", "US"), ("gr(polytonic)","GR"), ("il(biblical)", "HEB"), ("th", "THAI")]
                   , Run BatteryP ["BAT0"] ["-t", "<acstatus>",
                                            "--",
                                            "-P",
                                            "-O", "\xf583 <left>",
                                            "-o", "\xf578 <left>",
                                            "-H", "10", "-L", "7"
                                            ] 50
                   , Run Date "<fn=0>\xf133</fn>  %b %d %Y - (%H:%M)" "date" 50
       , Run StdinReader
                   ]
      , sepChar = "%"
      , alignSep = "}{"
      , template = "%StdinReader%}\
                   \{ %os% %uname% | %life% | %caff% | %kbd% | %cpu% ~ %memory% | %wlp4s0% | %myvolume% | %battery% | %date%"
      }
    '';
  };
}
