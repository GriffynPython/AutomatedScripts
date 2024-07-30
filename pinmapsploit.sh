if [ -z "$1" ]; then
  echo "Usage: $0 <IP_ADDRESS>"
  exit 1
fi

# Assign the first argument to a variable
TARGET_IP=$1

# Run nmap scan
echo "Running nmap scan on $TARGET_IP..."
nmap_output=$(nmap -sC -sV $TARGET_IP)

# Extract version information from nmap output
echo "Extracting version information from nmap output..."
versions=$(echo "$nmap_output" | grep -oP '(\d+\.\d+|(\d+\.){2,}\d+)' | sort | uniq)

# Search for exploits using searchsploit
echo "Searching for exploits using searchsploit..."
for version in $versions; do
  echo "Searching exploits for version: $version"
  searchsploit $version
done

# Save nmap output to a file
echo "Saving nmap output to nmap_output.txt"
echo "$nmap_output" > nmap_output.txt

# Save version information to a file
echo "Saving extracted versions to versions.txt"
echo "$versions" > versions.txt

echo "Script execution completed."