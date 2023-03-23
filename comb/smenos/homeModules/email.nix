{ ... }:

{
  programs.mbsync.enable = true;
  accounts.email = {
    accounts.personal = {
      realName = "Joseph Raub";
      userName = "josephraub98@gmail.com";
      passwordCommand = "pass email/mu-gmail";
      address = "josephraub98@gmail.com";
      flavor = "gmail.com";
      primary = true;
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
        flatten = ".";
        patterns = [
          "*"
          "![Gmail]*"
          "[Gmail]/Sent Mail"
          "[Gmail]/All Mail"
          "[Gmail]/Trash"
        ];
      };
      mu.enable = true;
    };
    accounts.work = {
      realName = "Joseph Raub";
      userName = "jraub@nhbcwylie.org";
      passwordCommand = "pass email/mu-nhbc";
      address = "jraub@nhbcwylie.org";
      flavor = "gmail.com";
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
        flatten = ".";
        patterns = [
          "*"
          "![Gmail]*"
          "[Gmail]/Sent Mail"
          "[Gmail]/All Mail"
          "[Gmail]/Trash"
        ];
      };
      mu.enable = true;
    };
  };

}
