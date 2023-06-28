#!/usr/bin/env bash
set -ex

APP_ID="org.featherwallet.Feather"

get_store_path() {
    find gnu/store -maxdepth 1 -type d -name "*$1*" | sort | head -n 1
}

mkdir -p /output/flatpak
cd /output/flatpak

# Create build dir
mkdir build
cd build

mkdir export
cp -a /feather/contrib/flatpak/share export
rm -rf export/share/app-info

# Copy the metadata file
cp /feather/contrib/flatpak/metadata .

mkdir files
cd files

# Copy feather binary
cp /feather-bin feather

# Copy metadata
cp -a /feather/contrib/flatpak/share .
touch --no-dereference --date="@${SOURCE_DATE_EPOCH}" share/metainfo/${APP_ID}.metainfo.xml
gzip -c share/metainfo/${APP_ID}.metainfo.xml > share/app-info/xmls/${APP_ID}.xml.gz

# Extract guix pack
tar xf /pack .

# Get store paths
GUIX_PROFILE=$(get_store_path "profile")
GUIX_GLIBC=$(get_store_path "glibc")
GUIX_FONTCONFIG=$(get_store_path "fontconfig")
GUIX_GCC=$(get_store_path "gcc")
LN_GUIX_STORE="$(get_store_path "ln-guix-store")/bin/ln-guix-store"

# Patch Feather binary
patchelf --set-interpreter "/${GUIX_GLIBC}/lib/ld-linux-x86-64.so.2" feather
patchelf --set-rpath "/${GUIX_GLIBC}/lib:/${GUIX_FONTCONFIG}/lib:/${GUIX_GCC}/lib" feather

# Fonts
# fontconfig looks in /app/share/fonts
ln -s "/run/host/fonts" share/fonts
ln -s "/run/host/fonts-cache" share/fonts-cache
ln -s "/${GUIX_PROFILE}/share/locale" share/locale
ln -s "/${GUIX_PROFILE}/share/dbus-1" share/dbus-1
ln -s "/${GUIX_PROFILE}/share/xml" share/xml

# Setup profile symlink
ln -s "/${GUIX_PROFILE}" profile

# Setup startup symlink
ln -s "/app/${LN_GUIX_STORE}" startup