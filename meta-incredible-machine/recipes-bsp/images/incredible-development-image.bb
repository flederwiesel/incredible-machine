require recipes-bsp/images/incredible-base-image.bb

IMAGE_FEATURES = " \
    bash-completion-pkgs \
    dbg-pkgs \
    debug-tweaks \
    dev-pkgs \
    tools-debug \
    tools-profile \
"

IMAGE_INSTALL:append = " \
    bash-completion \
"
