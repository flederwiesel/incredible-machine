require recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES = "ssh-server-openssh"

IMAGE_INSTALL:append = " \
    firstboot \
    os-release \
    packagegroup-core-ssh-openssh \
    rsync \
"
