#!/bin/bash

# ========================================
# Stop the PostgreSQL 15 Service
# ========================================
echo "Stopping the PostgreSQL 15 service..."
sudo systemctl stop postgresql-15

# ========================================
# Remove PostgreSQL 15 and Its Packages
# ========================================
echo "Removing PostgreSQL 15 packages..."
sudo yum remove postgresql15-server postgresql15-contrib -y

# ========================================
# Remove PostgreSQL 15 Directories and Configuration Files
# ========================================
echo "Removing PostgreSQL 15 directories and configuration files..."

# Target specific directories where PostgreSQL files are commonly stored
sudo rm -rf /var/lib/pgsql
sudo rm -rf /etc/postgresql
sudo rm -rf /usr/pgsql-15

# Check if there are any leftover files in /var/log and /var/run
sudo find /var/log -name "postgres*" -exec rm -rf {} +
sudo find /var/run -name "postgres*" -exec rm -rf {} +

# ========================================
# Check if All Files Have Been Removed
# ========================================
echo "Checking if there are no PostgreSQL processes running..."
ps aux | grep postgres

# ========================================
# Remove Any Remaining Configuration Residuals
# ========================================
echo "Removing any remaining PostgreSQL-related files..."
# Target common directories instead of the whole filesystem
sudo find /home /usr/local /opt /srv -name "postgres*" -exec rm -rf {} +

echo "PostgreSQL 15 uninstallation completed."
