FROM pritunl/archlinux:latest as mirrorlist
ARG THREADS
RUN pacman -S --noconfirm reflector && \
    reflector --sort rate --threads ${THREADS:-$(nproc)} --fastest 50 --score 200 --protocol https --protocol http --save /etc/pacman.d/mirrorlist


FROM archimg/base:latest

COPY --from=mirrorlist /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist
RUN sed -i '/^#\[multilib\]$/,/^#Include/s/^#//' /etc/pacman.conf && \
    pacman -Syu --noconfirm && \
    yes | pacman -Scc && \
    rm -f /etc/pacman.d/mirrorlist.pacnew /etc/pacman.conf.pacnew

