#!/bin/bash

# ========================================
# Stop the PostgreSQL Service
# ========================================
echo "Stopping the PostgreSQL service..."
sudo systemctl stop postgresql

# ========================================
# Remove PostgreSQL and Its Packages
# ========================================
echo "Removing PostgreSQL packages..."
sudo yum remove postgresql-server postgresql-contrib -y

# ========================================
# Remove PostgreSQL Directories and Configuration Files
# ========================================
echo "Removing PostgreSQL directories and configuration files..."
sudo find /var/lib/pgsql /etc/postgresql /usr/pgsql* -name "postgres*" -exec rm -rf {} +

# ========================================
# Check if All Files Have Been Removed
# ========================================
echo "Checking if there are no PostgreSQL processes running..."
ps aux | grep postgres

# ========================================
# Remove Any Remaining Configuration Residuals
# ========================================
echo "Removing any remaining configuration residuals..."
sudo find / -name "postgres*" -exec rm -rf {} +

echo "PostgreSQL uninstallation completed."

