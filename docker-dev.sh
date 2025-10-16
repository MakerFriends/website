#!/bin/bash

# MakerFriends.com Containerized Development Helper Script
# This script makes it easy to work with containerized development environments
# Supports Docker Desktop, Rancher Desktop, Podman, Colima, OrbStack, and other Docker-compatible tools

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

# Function to detect containerization tool
detect_container_tool() {
    if command -v docker > /dev/null 2>&1 && docker info > /dev/null 2>&1; then
        echo "docker-compose"
    elif command -v podman > /dev/null 2>&1 && podman info > /dev/null 2>&1; then
        echo "podman-compose"
    elif command -v colima > /dev/null 2>&1 && colima status > /dev/null 2>&1; then
        echo "docker-compose"
    else
        echo "none"
    fi
}

# Function to check if containerization tool is running
check_container_tool() {
    local tool=$(detect_container_tool)
    
    if [ "$tool" = "none" ]; then
        print_error "No containerization tool detected or running."
        print_status "Please install and start one of the following:"
        print_status "- Docker Desktop: https://www.docker.com/products/docker-desktop/"
        print_status "- Rancher Desktop: https://rancherdesktop.io/"
        print_status "- Podman: https://podman.io/"
        print_status "- Colima: brew install colima && colima start"
        print_status "- OrbStack: https://orbstack.dev/"
        exit 1
    fi
    
    COMPOSE_CMD=$tool
    print_status "Using $COMPOSE_CMD"
}

# Function to start development environment
start_dev() {
    print_status "Starting MakerFriends.com development environment..."
    check_container_tool
    
    $COMPOSE_CMD up -d
    print_success "Development environment started!"
    print_status "Site available at: http://localhost:4321"
    print_status "View logs with: ./docker-dev.sh logs"
}

# Function to stop development environment
stop_dev() {
    print_status "Stopping development environment..."
    check_container_tool
    $COMPOSE_CMD down
    print_success "Development environment stopped!"
}

# Function to view logs
view_logs() {
    print_status "Viewing development logs (Ctrl+C to exit)..."
    check_container_tool
    $COMPOSE_CMD logs -f app
}

# Function to run commands in container
run_command() {
    if [ -z "$1" ]; then
        print_error "Please provide a command to run"
        echo "Usage: ./docker-dev.sh run <command>"
        echo "Example: ./docker-dev.sh run npm install"
        exit 1
    fi
    
    print_status "Running command in container: $1"
    check_container_tool
    $COMPOSE_CMD exec app $1
}

# Function to access container shell
shell() {
    print_status "Accessing container shell..."
    check_container_tool
    $COMPOSE_CMD exec app sh
}

# Function to rebuild containers
rebuild() {
    print_status "Rebuilding containers..."
    check_container_tool
    $COMPOSE_CMD down
    $COMPOSE_CMD up --build -d
    print_success "Containers rebuilt and started!"
}

# Function to clean up everything
cleanup() {
    print_warning "This will remove all containers, volumes, and images. Continue? (y/N)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        print_status "Cleaning up container resources..."
        check_container_tool
        $COMPOSE_CMD down -v --rmi all
        
        # Use the appropriate cleanup command based on the tool
        if [ "$COMPOSE_CMD" = "podman-compose" ]; then
            podman system prune -f
        else
            docker system prune -f
        fi
        
        print_success "Cleanup completed!"
    else
        print_status "Cleanup cancelled."
    fi
}

# Function to show help
show_help() {
    echo "MakerFriends.com Containerized Development Helper"
    echo "Supports Docker Desktop, Rancher Desktop, Podman, Colima, OrbStack, and other Docker-compatible tools"
    echo ""
    echo "Usage: ./docker-dev.sh [command]"
    echo ""
    echo "Commands:"
    echo "  start     Start the development environment"
    echo "  stop      Stop the development environment"
    echo "  restart   Restart the development environment"
    echo "  logs      View development logs"
    echo "  run       Run a command in the container"
    echo "  shell     Access the container shell"
    echo "  rebuild   Rebuild containers from scratch"
    echo "  cleanup   Remove all containers, volumes, and images"
    echo "  status    Show container status"
    echo "  help      Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./docker-dev.sh start"
    echo "  ./docker-dev.sh run npm install"
    echo "  ./docker-dev.sh run npm run build"
    echo "  ./docker-dev.sh shell"
}

# Function to show status
show_status() {
    print_status "Container status:"
    check_container_tool
    $COMPOSE_CMD ps
}

# Main script logic
case "${1:-help}" in
    start)
        start_dev
        ;;
    stop)
        stop_dev
        ;;
    restart)
        stop_dev
        start_dev
        ;;
    logs)
        view_logs
        ;;
    run)
        shift
        run_command "$@"
        ;;
    shell)
        shell
        ;;
    rebuild)
        rebuild
        ;;
    cleanup)
        cleanup
        ;;
    status)
        show_status
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
