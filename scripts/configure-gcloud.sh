setup_gcloud () {
    echo installing gcloud
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
    tar -xf google-cloud-cli-linux-x86_64.tar.gz -C ~/
    rm google-cloud-cli-linux-x86_64.tar.gz
    ~/google-cloud-sdk/install.sh
    ~/google-cloud-sdk/bin/gcloud init
}

if [ -d ~/google-cloud-sdk ]; then
    echo "The directory ~/google-cloud-sdk already exists, it looks like gcloud is already installed. Aborting"
    exit
fi

while true; do
    read -p "Do you want to setup gcloud ? You can run this script later ./scripts/configure-gcloud.sh [y/n]" prompt
    echo
    case $prompt in
        [Yy]* ) setup_gcloud; break
        ;;
        [Nn]* ) exit
        ;;
        * ) echo "Please answer yes or no."
        ;;
    esac
done

