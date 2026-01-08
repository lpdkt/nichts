{
  environment.variables = {
    GOPATH = "/home/leroy/.local/share/go";
    GOBIN = "/home/leroy/.local/share/go/bin";
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.leroy.extraGroups = [
    "docker"
    "adbusers"
  ];
}
