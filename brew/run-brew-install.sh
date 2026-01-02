/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
source ~/.bashrc
/home/linuxbrew/.linuxbrew/bin/brew install yq

common_packages=$(/home/linuxbrew/.linuxbrew/bin/yq '.common' ./brew/brew-packages.yaml | sed -r 's/^-//g' | tr '\n,' ' ' | tr -d '[]"' | tr -d "'")
specific_packages=$(/home/linuxbrew/.linuxbrew/bin/yq .$1 ./brew/brew-packages.yaml | sed -r 's/^-//g' | tr '\n,' ' ' | tr -d '[]"' | tr -d "'")

concat_packages="$common_packages $specific_packages"
echo Installing $concat_packages
/home/linuxbrew/.linuxbrew/bin/brew install $concat_packages