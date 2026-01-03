echo "Setting autocrlf to input"
git config --global core.autocrlf input
read -p "Enter Name: " fullname
read -p "Enter Email: " email
git config --global user.name "$fullname"
git config --global user.email "$email"

echo "Installing Git Credential Manager"
git config --global credential.credentialStore plaintext
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
sudo rm -rf git-credential-manager