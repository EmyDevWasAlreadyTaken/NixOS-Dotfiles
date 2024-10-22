{ config, pkgs, username, terminal, inputs, ... }:
{
    programs.waybar = {
        enable = true;
    };
    programs.eww = {
        enable = true;
    };
}