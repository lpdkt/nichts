{
  programs.fish = {
    enable = true;

    shellAliases =
      let
        hostName = builtins.getEnv "HOSTNAME";
      in
      {
        conf = "cd ~/nichts";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        dev = "nix develop --impure -c \"$SHELL\"";
        nsh = "nix-shell --impure --command \"$SHELL\"";
        rebuild = "sudo nixos-rebuild switch --flake ~/nichts#${hostName}";
      };
  };
}
