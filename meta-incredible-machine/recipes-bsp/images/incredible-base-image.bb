require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL:append = " \
    os-release \
    rsync \
"
