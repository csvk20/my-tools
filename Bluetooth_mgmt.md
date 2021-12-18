# Bluetooth pairing on dual boot

1. Pair the device w/ Ubuntu (Easier if its the only paired device)
2. Pair the device w/ Windows (Easier if its the only paired device)
3. Boot into Ubuntu and follow:
    a. `sudo apt-get install chntpw`
    b. Mount your Windows system (generally the drive OS - path /media/<username>/OS)
4. `cd /media/<username>/OS/Windows/System32/config`
5. `chntpw -e SYSTEM` opens a console
6. Run these commands in that console:
    
    ```
    > cd CurrentControlSet\Services\BTHPORT\Parameters\Keys
    > # if there is no CurrentControlSet, then try ControlSet001
    > ls
    # shows you your Bluetooth port's MAC address
    Node has 1 subkeys and 0 values
      key name
      <aa1122334455>
    > cd aa1122334455  # cd into the folder
    > ls
    # lists the existing devices' MAC addresses
    Node has 0 subkeys and 1 values
      size     type            value name             [value if type DWORD]
        16  REG_BINARY        <001f20eb4c9a>
    > hex 001f20eb4c9a
    => :00000 XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX ...ignore..chars..
    # ^ the XXs are the pairing key
    ```
    
7. Make a note of which Bluetooth device MAC address matches which pairing key. The Mint/Ubuntu one won't need the spaces in-between. Ignore the `:00000`.
8. Switch to root: `sudo -i`
    a. cd to your Bluetooth config location `/var/lib/bluetooth/[bth port MAC addresses]`
    b. Here you'll find folders for each device you've paired with. The folder names being the Bluetooth devices' MAC addresses and contain a single file `info`. In these files, you'll see the link key you need to replace with your Windows ones, like so:
        
        ```
        [LinkKey]
        Key=B99999999FFFFFFFFF999999999FFFFF
        ```
        
9. Once updated, restart your Bluetooth service in one of the following ways, and then it works!
    
    ```
    sudo systemctl restart bluetooth
    ```
    
10. Reboot into Windows - it works!