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

## Support for Solarized colors
To use solarized theme, follow the below steps  
1. Copy the [colors](./colors) directory into the ~/.vim folder as shown in the last step
2. Install the Powerline fonts from [here](https://github.com/powerline/fonts)
3. Open terminal preferences and change the font to **Ubuntu Mono derivative Powerline**
4. Add the below lines (which are already updated in .vimrc) to avoid the separator mismatch

```
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
```

## Support for NERD Tree Dev-icons
You may find your NERD tree's dev-icons are not broken. If that is the case, 
download the patched font from [here](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf) 
and install it.  

### Installation
Double click on the .ttf file and it would open up a window with sample characters.  
You can find a Install button at the top right corner. Click it to install the fonts
