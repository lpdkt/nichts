let
  migadu = {
    imap = {
      host = "imap.migadu.com";
      port = 993;
    };
    smtp = {
      host = "smtp.migadu.com";
      port = 465;
    };
  };
in
{
  programs = {
    thunderbird = {
      enable = true;
      profiles."default".isDefault = true;
      settings = {
        "mail.biff.show_tray_icon_always" = true;
      };
    };
  };

  accounts.email.accounts = {
    "mail@lpdkt.xyz" = migadu // {
      realName = "lpdkt";
      address = "mail@lpdkt.xyz";
      userName = "mail@lpdkt.xyz";
      thunderbird.enable = true;
      primary = true;
    };

    "mail@leroytraebert.de" = migadu // {
      realName = "Leroy Traebert";
      address = "mail@leroytraebert.de";
      userName = "mail@leroytraebert.de";
      thunderbird.enable = true;
    };
  };
}
