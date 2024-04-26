PR = "r0"
DESCRIPTION = "Raspberry Pi firstboot script"
SECTION = "system"
DEPENDS = ""
RDEPENDS:${PN} = "bash e2fsprogs-resize2fs gawk sed util-linux"
SUMMARY = ""

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


SRC_URI = "${@'file://${BPN}' if '${MACHINE}'.startswith('raspberrypi') else ''}"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    if [ -n "${SRC_URI}" ]; then
        install -m 755 -d "${D}${libdir}"
        install -m 755 -t "${D}${libdir}" "${WORKDIR}/firstboot"
    fi
}

FILES:${PN} = "${libdir}"
