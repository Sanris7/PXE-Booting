#!/bin/bash

# List of services for PXE booting
SERVICES=("dnsmasq" "tftp" "vsftpd")

# Function to enable services
enable_services() {
    echo "Enabling services..."
    for service in "${SERVICES[@]}"; do
        systemctl enable $service
        if [ $? -eq 0 ]; then
            echo "$service enabled successfully."
        else
            echo "Failed to enable $service."
        fi
    done
}

# Function to start services
start_services() {
    echo "Starting services..."
    for service in "${SERVICES[@]}"; do
        systemctl start $service
        if [ $? -eq 0 ]; then
            echo "$service started successfully."
        else
            echo "Failed to start $service."
        fi
    done
}

# Function to restart services
restart_services() {
    echo "Restarting services..."
    for service in "${SERVICES[@]}"; do
        systemctl restart $service
        if [ $? -eq 0 ]; then
            echo "$service restarted successfully."
        else
            echo "Failed to restart $service."
        fi
    done
}

# Function to check status of services
status_services() {
    echo "Checking service status..."
    for service in "${SERVICES[@]}"; do
        systemctl status $service --no-pager
    done
}

# Main script logic
case $1 in
    enable)
        enable_services
        ;;
    start)
        start_services
        ;;
    restart)
        restart_services
        ;;
    status)
        status_services
        ;;
    *)
        echo "Usage: $0 {enable|start|restart|status}"
        exit 1
        ;;
esac