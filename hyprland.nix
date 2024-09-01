{ config, pkgs, username, terminal, ... }:
{

  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, Q, exec, kitty"
      "SUPER, C, killactive"
      "SUPER, F, exec, firefox"
      "SUPER, SPACE, exec, rofi -show drun" 
    ];

    input = {
      kb_layout = "es";
      repeat_delay = 212;
      repeat_rate = 30;
      follow_mouse = 1;
      touchpad = {natural_scroll = false;};

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
	force_no_accel = true;
    };
   gestures = {
     workspace_swipe = true;
     workspace_swipe_fingers = 4;
   };
  };

}
