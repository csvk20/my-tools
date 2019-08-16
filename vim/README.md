# VIM for a productive coding

Instructions and important config files for setting up a beautiful and productive VIM

## First things first
Create a .vimrc  
You can find the [.vimrc](./.vimrc)

## Install Vundle

I have tried both pathogen and vundle and found vundle is the thing for me.  
Both are great. But with pathogen, there is no place to store the information 
of all the repositories that I have cloned where Vundle maintains that information 
inside the .vimrc itself and setting up new PC with VIM takes less than 20 mins.

You can install Vundle by following [this](https://github.com/VundleVim/Vundle.vim)  
or  
Clone the repository into your .vim directory
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Install the packages

Now install the packages by launching **vim** and running **:PluginInstall**  
The package list is already in the .vimrc

## Support packages
Now add the support packages into their place.  
I use solarized color panel. This can be found inside [colors](./colors)  
The syntax files for different languages can be found inside [syntax](./syntax) folder
