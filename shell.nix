{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;
nixpkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    bundler
    imagemagick
    imagemagick.dev
    postgresql.lib
    postgresql
    sqlite
    sqlite.dev
    yarn
    glibc.dev
    glib
    vips
    vips.dev
  ];

  PKG_CONFIG_PATH = "${pkgs.imagemagick.dev}/lib/pkgconfig";
  LD_LIBRARY_PATH="${pkgs.glib.out}/lib:${pkgs.vips.out}/lib";
}
