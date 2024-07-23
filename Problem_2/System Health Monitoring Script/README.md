# System Health Monitoring Script

This script monitors the health of a Linux system by checking CPU usage, memory usage, disk space, and running processes. If any of these metrics exceed predefined thresholds, the script logs an alert to a log file.

## Prerequisites

- A Linux system with `bash` shell.
- Basic knowledge of command-line operations.
- Appropriate permissions to create and modify files in `/var/log`.

## Setup

1. **Create the Log File and Give Coreect Permissions**

   ```bash
   sudo touch /var/log/system_health_monitor.log
   sudo chmod 666 /var/log/system_health_monitor.log
   ```

2. **Make the Script Executable**

   ```bash
   chmod +x monitor_health.sh
   ```

3. **Run the script manually or set up a cron job to run it periodically**

   ```bash
   ./monitor_health.sh
   ```
   OR        
   ```bash
   */5 * * * * /path/to/monitor_health.sh
   ```

4. **Viewing Log Data**

   ```bash
   cat /var/log/system_health_monitor.log
   ```
   ![image](https://github.com/user-attachments/assets/a7ef6f34-fff8-409e-acf9-1690793cee50)
