#!/bin/bash

# Colors for pretty output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print colored status messages
print_status() {
    echo -e "${BLUE}==>${NC} ${1}"
}

print_success() {
    echo -e "${GREEN}✔${NC} ${1}"
}

print_warning() {
    echo -e "${YELLOW}!${NC} ${1}"
}

print_error() {
    echo -e "${RED}✘${NC} ${1}"
}

# Check if Homebrew is installed
check_brew() {
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed! Please install it first:"
        echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
}

# Check for sudo without password
check_sudo() {
    echo "DEBUG: Checking sudo status..."
    if ! sudo -n true 2>/dev/null; then
        print_status "Administrator privileges needed for some operations. Please enter your password:"
        if ! sudo -v; then
            print_error "Failed to obtain sudo privileges"
            exit 1
        fi
        echo "DEBUG: Successfully obtained sudo token"
    else
        echo "DEBUG: Existing sudo token found"
    fi
}

# Common Homebrew domains to pre-resolve
BREW_DOMAINS=(
    "formulae.brew.sh"
    "api.github.com"
    "raw.githubusercontent.com"
    "github.com"
    "formulae.brew.sh/api/formula.jws.json"
    "formulae.brew.sh/api/cask.jws.json"
    "formulae.brew.sh/api/formula_tap_migrations.jws.json"
    "formulae.brew.sh/api/cask_tap_migrations.jws.json"
)

# Pre-resolve DNS for Homebrew domains
warm_dns() {
    print_status "Pre-resolving Homebrew domains..."
    
    local need_flush=false
    
    # Try dig first for each domain
    for domain in "${BREW_DOMAINS[@]}"; do
        if dig +short "$domain" >/dev/null 2>&1; then
            print_success "Pre-resolved $domain"
        else
            print_warning "Failed to resolve $domain"
            need_flush=true
        fi
    done
    
    # Only flush DNS if the initial resolution failed
    if [[ "$need_flush" = true && "$OSTYPE" == "darwin"* ]]; then
        print_status "DNS resolution failed. Need to flush DNS cache (requires sudo)..."
        sudo dscacheutil -flushcache
        sudo killall -HUP mDNSResponder
        print_success "DNS cache flushed"
        
        # Verify resolution after flush
        for domain in "${BREW_DOMAINS[@]}"; do
            if ping -c 1 "$domain" >/dev/null 2>&1; then
                print_success "Resolved $domain after flush"
            else
                print_warning "Still cannot resolve $domain"
            fi
        done
    fi
}

# Retry a command up to 3 times with increasing delays
retry_command() {
    local cmd="$1"
    local tries=3
    local wait=5  # Increased initial wait
    
    for ((i=1; i<=tries; i++)); do
        if eval "$cmd"; then
            return 0
        else
            if [ $i -lt $tries ]; then
                print_warning "Command failed, retrying in ${wait} seconds... (Attempt $i/$tries)"
                sleep $wait
                wait=$((wait * 2))
            fi
        fi
    done
    return 1
}

# Main function to run all operations
main() {
    # Header
    echo -e "\n${GREEN}🍺 Homebrew Maintenance Script${NC}\n"

    # Check prerequisites
    check_brew
    check_sudo

    # Update Homebrew
    print_status "Updating Homebrew..."
    if ! brew update; then
        print_warning "Initial update failed, warming up DNS..."
        warm_dns
        if ! retry_command "brew update"; then
            print_error "Failed to update Homebrew after multiple attempts"
            exit 1
        fi
    fi
    print_success "Homebrew updated successfully"

    # Upgrade all packages
    print_status "Upgrading packages..."
    if ! brew upgrade; then
        print_warning "Initial upgrade failed, retrying..."
        if ! retry_command "brew upgrade"; then
            print_warning "Some packages may not have upgraded properly"
        fi
    else
        print_success "All packages upgraded successfully"
    fi

    # Upgrade casks
    if [[ "$OSTYPE" == "darwin"* ]]; then  # Only run on macOS
        print_status "Upgrading casks..."
        if brew upgrade --cask; then
            print_success "All casks upgraded successfully"
        else
            print_warning "Some casks may not have upgraded properly"
        fi
    fi

    # Cleanup
    print_status "Cleaning up..."
    if brew cleanup -s; then
        print_success "Cleanup completed successfully"
    else
        print_warning "Cleanup may not have completed properly"
    fi

    # Doctor check
    print_status "Running brew doctor..."
    if brew doctor; then
        print_success "Your Homebrew installation is healthy"
    else
        print_warning "Some issues were found with your Homebrew installation"
    fi

    echo -e "\n${GREEN}✨ Homebrew maintenance completed!${NC}\n"
}

# Add trap for cleanup
trap cleanup EXIT

# Trap Ctrl+C and handle it gracefully
trap 'echo -e "\n${YELLOW}Script interrupted by user${NC}"; exit 1' INT

# Run main function
main "$@"

# Add this function back
cleanup() {
    return 0
}
