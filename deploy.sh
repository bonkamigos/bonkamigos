#!/bin/bash

# Bonkamigos Web Deployment Script
# This script helps deploy the website to various platforms

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to validate files exist
validate_files() {
    print_status "Validating required files..."
    
    required_files=("index.html" "package.json" "README.md")
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            print_error "Required file $file not found!"
            exit 1
        fi
    done
    
    print_success "All required files found!"
}

# Function to test locally
test_local() {
    print_status "Starting local development server..."
    
    if command_exists python3; then
        print_status "Using Python 3 server..."
        python3 -m http.server 8000 &
        SERVER_PID=$!
        print_success "Local server started at http://localhost:8000"
        print_warning "Press Ctrl+C to stop the server"
        wait $SERVER_PID
    elif command_exists python; then
        print_status "Using Python server..."
        python -m http.server 8000 &
        SERVER_PID=$!
        print_success "Local server started at http://localhost:8000"
        print_warning "Press Ctrl+C to stop the server"
        wait $SERVER_PID
    else
        print_error "Python not found. Please install Python to test locally."
        exit 1
    fi
}

# Function to deploy to Vercel
deploy_vercel() {
    print_status "Deploying to Vercel..."
    
    if ! command_exists vercel; then
        print_warning "Vercel CLI not found. Installing..."
        npm install -g vercel
    fi
    
    vercel --prod
    print_success "Deployed to Vercel!"
}

# Function to deploy to Netlify
deploy_netlify() {
    print_status "Deploying to Netlify..."
    
    if ! command_exists netlify; then
        print_warning "Netlify CLI not found. Installing..."
        npm install -g netlify-cli
    fi
    
    netlify deploy --prod --dir=.
    print_success "Deployed to Netlify!"
}

# Function to deploy to GitHub Pages
deploy_github_pages() {
    print_status "Preparing for GitHub Pages deployment..."
    
    if ! command_exists git; then
        print_error "Git not found. Please install Git first."
        exit 1
    fi
    
    # Check if we're in a git repository
    if [ ! -d ".git" ]; then
        print_warning "Not in a git repository. Initializing..."
        git init
        git add .
        git commit -m "Initial commit"
    fi
    
    print_status "Please follow these steps to deploy to GitHub Pages:"
    echo "1. Create a new repository on GitHub"
    echo "2. Add your GitHub repository as remote:"
    echo "   git remote add origin https://github.com/yourusername/bonkamigos-web.git"
    echo "3. Push to GitHub:"
    echo "   git push -u origin main"
    echo "4. Go to repository Settings > Pages"
    echo "5. Set source to 'Deploy from a branch' and select 'main'"
    echo "6. Your site will be available at: https://yourusername.github.io/bonkamigos-web"
}

# Function to show help
show_help() {
    echo "Bonkamigos Web Deployment Script"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  test     - Start local development server"
    echo "  vercel   - Deploy to Vercel"
    echo "  netlify  - Deploy to Netlify"
    echo "  github   - Prepare for GitHub Pages deployment"
    echo "  all      - Deploy to all platforms"
    echo "  help     - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 test"
    echo "  $0 vercel"
    echo "  $0 all"
}

# Main script logic
main() {
    print_status "Bonkamigos Web Deployment Script"
    echo ""
    
    # Validate files first
    validate_files
    
    case "${1:-help}" in
        "test")
            test_local
            ;;
        "vercel")
            deploy_vercel
            ;;
        "netlify")
            deploy_netlify
            ;;
        "github")
            deploy_github_pages
            ;;
        "all")
            print_status "Deploying to all platforms..."
            deploy_vercel
            deploy_netlify
            deploy_github_pages
            ;;
        "help"|*)
            show_help
            ;;
    esac
}

# Run main function with all arguments
main "$@" 