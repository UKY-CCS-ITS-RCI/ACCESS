import os

# Set to store unique software names
unique_software = set()

# Dictionary to store software and their corresponding resource providers
software_rp_mapping = {}

# List of files (each file represents a resource provider)
files = [
    "../software/anvil/anvil-cpu-software.txt",
    "../software/bridges2/bridges2-cpu-software.txt",
    "../software/darwin/darwin-cpu-software.txt",
    "../software/kyric/kyric-software-list.txt",
    "../software/aces/aces-cpu-software.txt",
    "../software/faster/faster-cpu-software.txt",
    "../software/delta/delta-cpu-software.txt",
    "../software/expanse/expanse-cpu-software.txt",
    "../software/ookami/ookami-software_list.txt",
    "../software/stampede3/stampede3-cpu-software.txt",
    "../software/jetstream/jetstream-software-list.txt"
]

# Iterate through each file
for file in files:
    # Extract resource provider name from file path
    rp_name = os.path.basename(os.path.dirname(file))
    # Read software names from the file
    with open(file, 'r') as f:
        for line in f:
            software = line.strip().lower()  # Convert to lowercase
            software = software.strip()  # Remove leading/trailing whitespace
            if software:  # Check if software name is not empty
                # Add software to the set of unique software
                unique_software.add(software)
                # Add software to the dictionary with resource provider
                if software in software_rp_mapping:
                    software_rp_mapping[software].append(rp_name)
                else:
                    software_rp_mapping[software] = [rp_name]

# Output the software and their corresponding resource providers
print("{:<35} {:<25}".format("Software", "Resource Provider"))
print("-" * 65)
for software, rps in sorted(software_rp_mapping.items()):
    print("{:<35} {:<25}".format(software, ', '.join(rps)))

# Output total unique software
total_unique_software = len(unique_software)
print("\nTotal unique software across all RPs : ", total_unique_software)

