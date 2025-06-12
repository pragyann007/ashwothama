#!/bin/bash

# created by : cipher_p
# created date : 2025-03-11
# last modified : 2025-03-11
# Usage : insatll reuired tools and services if not installed 

# program started ...

#  add the tools that is not installed in system to missing_tools array

missing_tools=()

# checks if tool is not installed
check_tool (){
    if ! command -v "$1" &> /dev/null; then 
        echo "❌ $1 is not installed in the device ."
        missing_tools+=("$1")
    else 
        echo "✅ All required tools are installed. You're good to go! $1 is installed in the device."
    fi 
}
# checks for the required tools
check_tool go 
check_tool subfinder
check_tool httpx
check_tool eyewitness
check_tool whois
check_tool subzy

# if tools are not present then installing it

if [ ${#missing_tools[@]} -ne 0  ]; then 
    echo -e "\n[!] Missing tools : ${missing_tools[@]}"
    read -p "⚠️  Do you want to install the missing tools? (y/n): " choice
    
    # checks if user want to install or not

    if [[ $choice == "y" ]]; then 
        for tool in "${missing_tools[@]}"; do 
            case $tool in 
                go)
                    echo "[*] Installing Go ...."
                    sleep 2 
                    sudo apt install golang -y 
                    ;;
                subfinder)
                    echo "[*] Installling Subfinder ..."
                    sleep 2 
                    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
                    ;;
                httpx)
                    echo "Installing httpx ..."
                    sleep 2 
                    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
                    ;;
                eyewitness)
                    echo "Installing EyeWitness ...."
                    sleep 2 
                    sudo apt install eyewitness -y
                    ;;
                whois)
                    echo "installing Whois ....."
                    sleep 2 
                    sudo apt install whois -y 
                    ;;
                subzy)
                    echo "Installing subzy ..."
                    sleep 2 
                    go install -v github.com/LukaSikic/subzy@latest
                    ;;
                esac
        done 
        echo "[✔] Installation process attempted. Make sure your PATH includes Go's bin directory:"
        echo "export PATH=\$PATH:\$(go env GOPATH)/bin"
    else 
        echo "⚠️  Please install the missing tools manually. Exiting..."
        exit 1 

     fi 
else 
    echo "✅ All required tools are installed. You're good to go!"
fi 

            

                    

                    



                    