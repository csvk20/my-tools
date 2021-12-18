
# Install gnome-tweaks and enable workspace
sudo apt install -y gnome-tweaks

# Isolate applications to each workspace
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true