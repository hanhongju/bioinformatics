pkgs = "
                      brasero build-essential calibre cifs-utils cmake code curl dirmngr \
                      firefox gimp gparted handbrake hashdeep krita krita-l10n libcurl4-openssl-dev \
                      libfribidi-dev libharfbuzz-dev libmagick++-dev libpcre3 libpcre3-dev libreoffice \
                      libreoffice-help-zh-cn libreoffice-l10n-zh-cn libssl-dev net-tools openssl p7zip-full \
                      qbittorrent r-base rhythmbox samba smplayer software-properties-common steam \
                      thunderbird trojan usb-creator-gtk virtualbox wget zlib1g-dev
"
pkgslist <- strsplit(pkgs, " ")
pkgsvectorsorted <- sort(pkgslist[[1]])
pkgssorted <- paste(pkgsvectorsorted, collapse = " ")
pkgssorted


