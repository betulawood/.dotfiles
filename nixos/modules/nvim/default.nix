{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      go
      rustc
      python3
      gopls
      rust-analyzer
      nodejs
      gcc
  ];


  programs.neovim = { 
    enable = true; 
    defaultEditor = true;
  };
}


