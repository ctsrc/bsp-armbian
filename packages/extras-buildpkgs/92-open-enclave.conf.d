
# openenclave
local package_name="open-enclave"
local package_repo="https://github.com/openenclave/openenclave.git"
local package_ref="branch:v0.13.x"
local package_install_target="open-enclave"
local package_component="${release}-utils"
# local package_install_chroot=""
local package_builddeps="cmake"

package_prepare() 
{
	if [[ ! -f /root/.pkg2_prepared_${package_name} ]]; then
		apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common wget
		wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
		apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'
		apt-get update
		touch /root/.pkg2_prepared_${package_name}
	fi
}

package_checkbuild()
{
	true
}

package_checkinstall()
{
	# only needed for building TA's and PPA
	true
}
