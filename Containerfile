ARG IMAGE_TYPE
ARG IMAGE_FLAVOUR
ARG IMAGE_VERSION
ARG IMAGE_BASE

FROM ${IMAGE_BASE}/${IMAGE_FLAVOUR}-${IMAGE_TYPE}:${IMAGE_VERSION}

COPY rootfs/etc /etc

RUN rpm-ostree install code fish bash nvtop htop breeze-cursor-theme cascadia-code-fonts qemu qemu-user-static qemu-user-binfmt libvirt qemu qemu-user-static qemu-user-binfmt edk2-ovmf ceph-common cockpit-bridge cockpit-system cockpit-networkmanager cockpit-selinux cockpit-storaged cockpit-podman cockpit-machines cockpit-ws incus incus-agent git-filter-repo git-subtree cockpit-ostree cockpit-packagekit distrobox 

RUN rm -rf /tmp/* /var/*
RUN ostree container commit