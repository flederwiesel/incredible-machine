FILESEXTRAPATHS:append := ":${THISDIR}/${BPN}"

SRC_URI += " \
    file://.bash_aliases \
    file://.bashrc \
    file://.profile \
"

do_install:prepend() {
    # Set nano as default $EDITOR
    sed -i 's/"vi"/"nano"/g' "${WORKDIR}/profile"
}

do_install:append() {
    install -d "${D}${ROOT_HOME}"
    install -m 0644 -t "${D}${ROOT_HOME}" "${WORKDIR}/.bash_aliases"
    install -m 0644 -t "${D}${ROOT_HOME}" "${WORKDIR}/.bashrc"
    install -m 0644 -t "${D}${ROOT_HOME}" "${WORKDIR}/.profile"
    # Overwrite the files installed by poky
    install -d "${D}${sysconfdir}/skel"
    install -m 0644 -t "${D}${sysconfdir}/skel" "${WORKDIR}/.bash_aliases"
    install -m 0644 -t "${D}${sysconfdir}/skel" "${WORKDIR}/.bashrc"
    install -m 0644 -t "${D}${sysconfdir}/skel" "${WORKDIR}/.profile"
}

FILES:${PN} += "${ROOT_HOME}/.* ${sysconfdir}/skel/.*"
