FROM base/archlinux:latest

ARG mirrorlist_url=https://www.archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4&use_mirror_status=on

RUN curl "$mirrorlist_url" | sed 's/^#//' > /etc/pacman.d/mirrorlist && \
    pacman -Syu --noconfirm && \
    pacman -Scc --noconfirm
