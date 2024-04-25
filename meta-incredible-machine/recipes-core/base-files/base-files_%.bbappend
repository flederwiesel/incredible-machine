do_install:prepend() {
    sed -i 's/"vi"/"nano"/g' "${WORKDIR}/profile"
}
