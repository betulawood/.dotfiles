{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    # Add any language servers, formatters, tools here if desired
  ];
}


