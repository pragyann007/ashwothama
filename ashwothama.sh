#!/bin/bash

# Define colors
RED='\033[91m'
BLUE='\033[94m'
RESET='\033[0m'

# Print ASHWATHAMA banner in red
echo -e "${RED}"
echo " .d888888           dP                             dP   dP                                    "
echo "d8'    88           88                             88   88                                    "
echo "88aaaaa88a .d8888b. 88d888b. dP  dP  dP .d8888b. d8888P 88d888b. .d8888b. 88d8b.d8b. .d8888b. "
echo "88     88  Y8ooooo. 88'  \`88 88  88  88 88'  \`88   88   88'  \`88 88'  \`88 88'\`88'\`88 88'  \`88 "
echo "88     88        88 88    88 88.88b.88' 88.  .88   88   88    88 88.  .88 88  88  88 88.  .88 "
echo "88     88  \`88888P' dP    dP 8888P Y8P  \`88888P'   dP   dP    dP \`88888P8 dP  dP  dP \`88888P8 "
echo -e "${RESET}"
echo ""
# Print author info in blue
echo -e "${BLUE}                             -created by cipher_p${RESET}"

chmod +x setup.sh
echo ""
echo ""

sleep 3

./setup.sh

echo ""

echo -e "${BLUE}Usage:
        1. Just enter your target domain, all work will be done by ASHWATHAMA
${RESET}"

sleep 1
read -p "Enter Domain Of a Target (eg - a.com) : " domain
sleep 2

echo -e "${RED}Gathering whois information of ${domain}...${RESET}"
sleep 1

# Get date for file name safely
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create results directory if not exists
if [ ! -d "results" ]; then
    mkdir results
fi

# Save whois info
whois "$domain" > "./results/whois_info_$timestamp.txt"

# Wait and confirm
sleep 1
echo -e "${RED}Saved file successfully as whois_info_$timestamp.txt${RESET}"

sleep 2

echo ""
# Scan for list of subdomains

echo "Finding its Subdomain ....."
sleep 2
echo "......Getting there"
echo ""

sleep 1

# Run subfinder and save output
subfinder -d "${domain}" -silent > "./results/subdomain_${domain}.txt"

sleep 1

# Count the number of subdomains found
file_path="./results/subdomain_${domain}.txt"

subdomain_count=$(wc -l < "${file_path}")
echo ""

echo "${subdomain_count} subdomain(s) found!"

echo "File saved successfully!"

echo ""

# scanning for live active domains
read -p "Do you want to check for active live subdomains? (y/n) : " live_choice

case $live_choice in
    y)
        echo "Finding Active Subdomain ...."
        httpx -silent -l "${file_path}" > "./results/live_${domain}.txt"
        echo ""
        livesubdomain_count=$(wc -l < "./results/live_${domain}.txt")
        echo "${livesubdomain_count} live subdomain(s) found !!"
        live_scan_done=true
        ;;
    n)
        echo "Best of luck for your bug hunt!"
        live_scan_done=false
        ;;
    *)
        echo "Invalid input, please enter (y/n) for proper command execution"
        exit 1
        ;;
esac

if [ "$live_scan_done" = true ] && [ -s "./results/live_${domain}.txt" ]; then
    # file exists and is not empty, ask for screenshots
    read -p "Do you want to take screenshots of the live subdomains? (y/n) : " screenshot_choice

    live_subdomain_count=$(wc -l < "./results/live_${domain}.txt")
    live_subdomain_filepath="./results/live_${domain}.txt"

    case ${screenshot_choice} in
        y)
            echo "Taking screenshots of ${live_subdomain_count} live active subdomains..."
            sleep 1
            echo "Processing ..."
            eyewitness -f "${live_subdomain_filepath}" --web --timeout 120
            ;;
        n)
            echo "No problem, keep hacking, keep exploiting!! Happy Hacking!"
            ;;
        *)
            echo "Invalid input, please enter (y/n) for proper command execution"
            exit 1
            ;;
    esac

else
    echo ""
    echo "Skipping screenshot step as no live subdomains were scanned or found."
    echo""
fi

echo "All the outputs are available inside the results folder to view them."
sleep 2
echo "Screenshots are also available in the ASHWATHAMA directory, so view them."
sleep 1
echo "Thank you for using ASHWATHAMA __cipher_p"

# version 1 completed....
