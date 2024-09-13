{ config, pkgs, username, terminal, ... }:
{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "SUPER, Q, exec, kitty"
      "SUPER, C, killactive"
      "SUPER, F, exec, firefox"
      "SUPER, SPACE, exec, rofi -show drun" 
      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"
      ",xf86Sleep, exec, systemctl suspend"
      ",XF86AudioMicMute,exec,pamixer --default-source -t"
      ",XF86MonBrightnessDown,exec,light -U 20"
      ",XF86MonBrightnessUp,exec,light -A 20"
      ",XF86AudioMute,exec,pamixer -t"
      ",XF86AudioLowerVolume,exec,pamixer -d 2"
      ",XF86AudioRaiseVolume,exec,pamixer -i 2"
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPause,exec,playerctl play-pause"
      ",xf86AudioNext,exec,playerctl next"
      ",xf86AudioPrev,exec,playerctl previous"
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      # Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
      "$mainMod CTRL, right, workspace, r+1"
      "$mainMod CTRL, left, workspace, r-1"
      # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
      "$mainMod CTRL ALT, right, movetoworkspace, r+1"
      "$mainMod CTRL ALT, left, movetoworkspace, r-1"
      "$mainMod CTRL ALT, mouse_down, movetoworkspace, r+1"
      "$mainMod CTRL ALT, mouse_up, movetoworkspace, r-1"
      # move to the first empty workspace instantly with mainMod + CTRL + [↓]
      "$mainMod CTRL, down, workspace, empty"
      # Move focus with mainMod + HJKL keys
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"
      # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
      "$mainMod SHIFT $CONTROL, left, movewindow, l"
      "$mainMod SHIFT $CONTROL, right, movewindow, r"
      "$mainMod SHIFT $CONTROL, up, movewindow, u"
      "$mainMod SHIFT $CONTROL, down, movewindow, d"
      # Move active window around current workspace with mainMod + SHIFT + CTRL [HLJK]
      "$mainMod SHIFT $CONTROL, H, movewindow, l"
      "$mainMod SHIFT $CONTROL, L, movewindow, r"
      "$mainMod SHIFT $CONTROL, K, movewindow, u"
      "$mainMod SHIFT $CONTROL, J, movewindow, d"
      
    ];
    binde = [
      # Resize windows
      "$mainMod SHIFT, right, resizeactive, 30 0"
      "$mainMod SHIFT, left, resizeactive, -30 0"
      "$mainMod SHIFT, up, resizeactive, 0 -30"
      "$mainMod SHIFT, down, resizeactive, 0 30"
       # Resize windows with hjkl keys
      "$mainMod SHIFT, l, resizeactive, 30 0"
      "$mainMod SHIFT, h, resizeactive, -30 0"
      "$mainMod SHIFT, k, resizeactive, 0 -30"
      "$mainMod SHIFT, j, resizeactive, 0 30"
        ];
    input = {
      kb_layout = "";
      repeat_delay = 212;
      repeat_rate = 30;
      follow_mouse = 1;
      touchpad = {natural_scroll = false;};

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
	    force_no_accel = true;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
    };

    decoration = {
    rounding = 10;
    drop_shadow = false;
    dim_special = 0.3;
      blur = {
        enabled = true;
        special = true;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };
        
        
    windowrulev2 = [
      #"noanim, class:^(Rofi)$
      "tile,title:(.*)(Godot)(.*)$"
      "workspace 1, class:^(firefox)$"
      "workspace 2, class:^(kitty)$"
      "workspace 3, class:^(VSCodium)$"
      "workspace 3, class:^(codium-url-handler)$"
      "workspace 3, class:^(Code)$"
      "workspace 3, class:^(code-url-handler)$"
      "workspace 4, class:^(krita)$"
      "workspace 4, title:(.*)(Godot)(.*)$"
      "workspace 4, title:(GNU Image Manipulation Program)(.*)$"
      "workspace 5, class:^(Spotify)$"
      "workspace 5, title:(.*)(Spotify)(.*)$"
      "workspace 7, class:^(steam)$"
      # "workspace 10, class:^(factorio)$"
      "opacity 0.80 0.80,class:^(alacritty)$"
      "opacity 1.00 1.00,class:^(firefox)$"
      "opacity 0.90 0.90,class:^(Brave-browser)$"
      "opacity 0.80 0.80,class:^(Steam)$"
      "opacity 0.80 0.80,class:^(steam)$"
      "opacity 0.80 0.80,class:^(steamwebhelper)$"
      "opacity 0.80 0.80,class:^(Spotify)$"
      "opacity 0.80 0.80,title:(.*)(Spotify)(.*)$"
      # "opacity 0.80 0.80,class:^(VSCodium)$"
      # "opacity 0.80 0.80,class:^(codium-url-handler)$"
      "opacity 0.80 0.80,class:^(Code)$"
      "opacity 0.80 0.80,class:^(code-url-handler)$"
      "opacity 0.80 0.80,class:^(kitty)$"
      "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
      "opacity 0.80 0.80,class:^(org.kde.ark)$"
      "opacity 0.80 0.80,class:^(nwg-look)$"
      "opacity 0.80 0.80,class:^(qt5ct)$"
      "opacity 0.80 0.80,class:^(qt6ct)$"
      "opacity 0.80 0.80,class:^(com.obsproject.Studio)$" #Obs-Qt
      "opacity 0.80 0.80,class:^(gnome-boxes)$" #Boxes-Gtk
      "opacity 0.80 0.80,class:^(discord)$" #Discord-Electron
      "opacity 0.80 0.80,class:^(WebCord)$" #WebCord-Electron
      "opacity 0.80 0.80,class:^(app.drey.Warp)$" #Warp-Gtk
      "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
      "opacity 0.80 0.80,class:^(yad)$" #Protontricks-Gtk
      "opacity 0.80 0.80,class:^(Signal)$" #Signal-Gtk
      "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
      "opacity 0.80 0.70,class:^(pavucontrol)$"
      "opacity 0.80 0.70,class:^(blueman-manager)$"
      "opacity 0.80 0.70,class:^(nm-applet)$"
      "opacity 0.80 0.70,class:^(nm-connection-editor)$"
      "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "float,class:^(qt5ct)$"
      "float,class:^(nwg-look)$"
      "float,class:^(org.kde.ark)$"
      "float,class:^(Signal)$" #Signal-Gtk
      "float,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
      "float,class:^(app.drey.Warp)$" #Warp-Gtk
      "float,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
      "float,class:^(yad)$" #Protontricks-Gtk
      "float,class:^(eog)$" #Imageviewer-Gtk
      "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
      "float,class:^(pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
    ];     
  };
  wayland.windowManager.hyprland.extraConfig = ''
  monitor =, 1920x1080@144, 0x0, 1
  '';
}
