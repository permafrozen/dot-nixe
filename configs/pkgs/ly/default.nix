{ ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      # animation
      animation = "matrix";
      animation_timeout_sec = 0;

      # decoration
      hide_borders = false;
      blank_box = true;
      box_title = "lock in lil bro";

      # misc
      clear_password = true;
      text_in_center = true;
    };
  };
}
