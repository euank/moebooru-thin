{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;
nixpkgs.mkShell {
  buildInputs = with pkgs; [
    bundler
    glib
    glibc.dev
    imagemagick
    imagemagick.dev
    jhead
    postgresql
    postgresql.lib
    ruby
    sqlite
    sqlite.dev
    vips
    vips.dev
    yarn
  ];

  PKG_CONFIG_PATH = "${pkgs.imagemagick.dev}/lib/pkgconfig";
  LD_LIBRARY_PATH="${pkgs.glib.out}/lib:${pkgs.vips.out}/lib";
}
