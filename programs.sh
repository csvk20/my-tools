# Install Spotify
sudo snap install spotify

# Install VS Code
sudo snap install --classic code

# Install Sublime Text
sudo apt update
sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common curl
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text

# Install Notion
sudo snap install notion-snap