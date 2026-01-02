wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip 
unzip JetBrainsMono.zip -d JetBrainsMono
mkdir -p ~/.local/share/fonts
cp JetBrainsMono/*.ttf ~/.local/share/fonts
rm -rf JetBrainsMono/
rm JetBrainsMono.zip