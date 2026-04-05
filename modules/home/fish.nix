{
  programs.fish = {
    enable = true;

    shellAliases = {
      media = "cd /mnt/media/";
      music = "cd /mnt/media/music";
      vids = "cd /mnt/media/vids";
      conf = "cd ~/nichts";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      dev = "nix develop --impure -c \"$SHELL\"";
      nsh = "nix-shell --impure --command \"$SHELL\"";
    };

    loginShellInit = ''
      if [ (tty) = "/dev/tty1" ]
        start-hyprland
      end
    '';
  };
}
