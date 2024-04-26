# The copy in your home directory (~/.profile) is yours, please
# feel free to customise it to create a shell environment to your liking.

# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#
# if running bash
if [ -n "${BASH_VERSION}" ]; then
	if [ -f "${HOME}/.bashrc" ]; then
		source "${HOME}/.bashrc"
	fi
fi
