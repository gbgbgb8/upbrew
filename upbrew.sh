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
    if ! sudo -n true 2>/dev/null; then
        print_status "Administrator privileges needed for some operations. Please enter your password:"
        sudo -v
        # Keep sudo alive
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    fi
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
    if brew update; then
        print_success "Homebrew updated successfully"
    else
        print_error "Failed to update Homebrew"
        exit 1
    fi

    # Upgrade all packages
    print_status "Upgrading packages..."
    if brew upgrade; then
        print_success "All packages upgraded successfully"
    else
        print_warning "Some packages may not have upgraded properly"
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

# Trap Ctrl+C and handle it gracefully
trap 'echo -e "\n${YELLOW}Script interrupted by user${NC}"; exit 1' INT

# Run main function
main "$@"
