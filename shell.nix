{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;
nixpkgs.mkShell {
  buildInputs = with pkgs; [
    glib
    imagemagick
    imagemagick.dev
    ffmpeg
    jhead
    memcached
    postgresql.pg_config
    postgresql
    postgresql.dev
    ruby_3_4
    (bundler.override { ruby = ruby_3_4; })
    sqlite
    sqlite.dev
    vips
    vips.dev
    yarn
  ];

  PKG_CONFIG_PATH = "${pkgs.imagemagick.dev}/lib/pkgconfig";
  LD_LIBRARY_PATH="${pkgs.glib.out}/lib:${pkgs.vips.out}/lib";
  BUNDLE_PATH="${toString ./.}/vendor";
}
