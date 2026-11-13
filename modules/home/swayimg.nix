{
  programs.swayimg = {
    enable = true;
    initLua = ''
      swayimg.overlay = false
      swayimg.imagelist.order = "mtime"
      swayimg.imagelist.reverse = true
      swayimg.imagelist.adjacent = true
      swayimg.text.font = "Iosevka NF"
      swayimg.text.size = 16
      swayimg.format_conf = {
        video = {            
          enable = false,
        },
      }
      swayimg.viewer.on_key("q", function()
        swayimg.exit()
      end)
    '';
  };
}
