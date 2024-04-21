#!/bin/bash

# Array of files
files=(
    "../software/anvil/anvil-cpu-software.txt"
    "../software/bridges2/bridges2-cpu-software.txt"
    "../software/darwin/darwin-cpu-software.txt"
    "../software/kyric/kyric-software-list.txt"
    "../software/aces/aces-cpu-software.txt"
    "../software/faster/faster-cpu-software.txt"
    "../software/delta/delta-cpu-software.txt"
    "../software/expanse/expanse-cpu-software.txt"
    "../software/ookami/ookami-software_list.txt"
    "../software/stampede3/stampede3-cpu-software.txt"
    "../software/jetstream/jetstream-software-list.txt"
)

# Initialize counters
total_software=0
declare -A unique_software

# Loop through files
for file in "${files[@]}"; do
    # Extract system name from file path
    system=$(basename "$(dirname "$file")")
    # Read number of lines (software) in the file
    num_software=$(wc -l < "$file")
    # Increment total software count
    ((total_software += num_software))
    # Count unique software
    while IFS= read -r software; do
        software=$(echo "$software" | tr '[:upper:]' '[:lower:]' | xargs)  # Convert to lowercase and remove leading/trailing whitespace
        if [ ! -z "$software" ]; then  # Check if software name is not empty
            ((unique_software[$software]++))
        fi
    done < "$file"
    # Output number of software in each system
    echo "Number of software in $system system :  $num_software"
done

# Output total software across all systems
echo -e "\nTotal software across all RPs : $total_software"

# Count total unique software
total_unique_software=${#unique_software[@]}
echo "Total unique software across all RPs :  $total_unique_software"

