windows_program_files="/mnt/c/Program Files"
windows_users_dir="/mnt/c/Users"
local_programs_suffix="/AppData/Local/Programs"
credential_manager_suffix="/Git/mingw64/bin/git-credential-manager.exe"

credential_manager_paths=()

echo "Setting autocrlf to input"
git config --global core.autocrlf input
read -p "Enter Name: " fullname
read -p "Enter Email: " email
git config --global user.name "$fullname"
git config --global user.email "$email"

if [ -f "$windows_program_files$credential_manager_suffix" ]
then
    credential_manager_paths+=( "$windows_program_files$credential_manager_suffix" )
fi

for entry in "$windows_users_dir"/*
do
    cred_manager="$entry$local_programs_suffix$credential_manager_suffix"
    if [ -f "$cred_manager" ]
    then
        credential_manager_paths+=( "$cred_manager" )
    fi
done

nb_of_cred_manager=${#credential_manager_paths[@]}

if [ $nb_of_cred_manager -gt 1 ]
then 
    echo Found "${nb_of_cred_manager}" potential credential manager. Select the one you want to use :
    PS3="Enter choice index: "
    select item in "${credential_manager_paths[@]}"
    do
        selected_file=$(printf %q "$item")
        git config --global credential.helper "$selected_file"
        break
    done
elif [ $nb_of_cred_manager -eq 1 ]
then
    echo Found one credential manager : ${credential_manager_paths[0]}
    selected_file=$(printf %q "${credential_manager_paths[0]}")
    git config --global credential.helper "$selected_file"
else 
    echo No credential mangager found, is git installed on windows ? You can rerun this script later : ./scripts/configure-git
fi

echo The following git config has been set :
echo core.autocrlf : $(git config --get core.autocrlf)
echo user.name : $(git config --get user.name)
echo user.email : $(git config --get user.email)
echo credential.helper : $(git config --get credential.helper)
echo You can rerun this script later : ./scripts/configure-git