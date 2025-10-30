# This script is meant to be sourced.
# It's not for directly running.

#####################################################################################

v sudo usermod -aG video,i2c,input "$(whoami)"
v bash -c "echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf"
