### Using Fusuma for allowing touchpad gestures in Ubuntu 18.04 LTS
1. Check if the current user is a part of the input group
```bash
groups $USER | grep -w input # To check
sudo gpasswd -a $USER input  # To add
```

2. Install necessary softwares
```bash
sudo apt install libinput-tools
sudo apt install xdotool   # for sending shortcuts
sudo apt install ruby
sudo apt install ruby
```

3. Go to config folder in home directory
```bash
cd ~/.config
```

4. Create a folder name fusuma in .config folder
```bash
mkdir fusuma  
```

5. Copy the config.yml file to ~/.config directory

6. Run the following command to run fusuma in background
```bash 
sudo fusuma -d
```
