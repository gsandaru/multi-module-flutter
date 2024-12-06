#!/bin/bash
# origin	https://github.com/gsandaru/core_services_poc.git (fetch)
# origin	https://github.com/gsandaru/domain_a_poc.git (fetch)
# origin	https://github.com/gsandaru/domain_b_poc.git (fetch)

# Configuration
PACKAGES_DIR="packages"
PACKAGE_REPOS=(
    "git@github.com:gsandaru/core_services_poc.git"
    "git@github.com:gsandaru/domain_a_poc.git"
    "git@github.com:gsandaru/domain_b_poc.git"
)

# Create packages directory if it doesn't exist
mkdir -p "$PACKAGES_DIR"

# Function to show menu
show_menu() {
    echo "Available packages:"
    for i in "${!PACKAGE_REPOS[@]}"; do
        local repo_name=$(basename "${PACKAGE_REPOS[$i]}" .git)
        if [ -d "$PACKAGES_DIR/$repo_name" ]; then
            echo "[$((i+1))] $repo_name [Installed]"
        else
            echo "[$((i+1))] $repo_name"
        fi
    done
    echo "[0] Exit and Bootstrap the Project!"
}

# Function to clone repository
clone_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    local target_dir="$PACKAGES_DIR/$repo_name"
    
    if [ -d "$target_dir" ]; then
        echo "Package $repo_name is already installed"
        return
    fi
    
    echo "Cloning $repo_name..."
    git clone "$repo_url" "$target_dir"
}

# Function to remove repository
remove_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    local target_dir="$PACKAGES_DIR/$repo_name"
    
    if [ ! -d "$target_dir" ]; then
        echo "Package $repo_name is not installed"
        return
    fi
    
    echo "Removing $repo_name..."
    rm -rf "$target_dir"
}

# Main loop
while true; do
    echo "Flutter Packages Setup"
    echo "====================="
    show_menu
    
    read -p "Select package to install/remove (0 to exit): " choice
    
    if [ "$choice" == "0" ]; then
        break
    fi
    
    if [ "$choice" -gt 0 ] && [ "$choice" -le "${#PACKAGE_REPOS[@]}" ]; then
        repo_url="${PACKAGE_REPOS[$((choice-1))]}"
        repo_name=$(basename "$repo_url" .git)
        
        if [ -d "$PACKAGES_DIR/$repo_name" ]; then
            read -p "Package $repo_name is installed. Remove it? (y/n): " remove
            if [ "$remove" == "y" ]; then
                remove_repo "$repo_url"
            fi
        else
            clone_repo "$repo_url"
        fi
    else
        echo "Invalid choice"
    fi
    
    echo ""
done

# Update melos config if needed
if [ -f "melos.yaml" ]; then
    echo "Updating melos configuration..."
    melos bootstrap
fi
