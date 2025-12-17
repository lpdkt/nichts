{
  programs.fish = {
    enable = true;

    shellAliases = {
      media = "cd /mnt/media/";
      music = "cd /mnt/media/music";
      conf = "cd ~/nichts";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      dev = "nix develop --impure -c \"$SHELL\"";
    };
  };
}
