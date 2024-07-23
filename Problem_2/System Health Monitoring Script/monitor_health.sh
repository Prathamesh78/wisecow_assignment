#!/bin/bash

   # Define thresholds
   CPU_THRESHOLD=80
   MEMORY_THRESHOLD=80
   DISK_THRESHOLD=80
   PROCESS_THRESHOLD=150  # Define a threshold for the number of running processes

   # Define log file
   LOG_FILE="/var/log/system_health_monitor.log"

   # Function to log messages
   log_message() {
       local message="$1"
       echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
   }

   # Log the start of the script
   log_message "System health monitor script started."

   # Check CPU usage
   CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
   log_message "Current CPU usage: ${CPU_USAGE}%"
   if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
       log_message "High CPU usage detected: ${CPU_USAGE}%"
   fi

   # Check memory usage
   MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')
   log_message "Current memory usage: ${MEMORY_USAGE}%"
   if (( MEMORY_USAGE > MEMORY_THRESHOLD )); then
       log_message "High memory usage detected: ${MEMORY_USAGE}%"
   fi

   # Check disk space usage
   DISK_USAGE=$(df / | awk '/\// {print $5}' | sed 's/%//')
   log_message "Current disk space usage: ${DISK_USAGE}%"
   if (( DISK_USAGE > DISK_THRESHOLD)); then
       log_message "High disk space usage detected: ${DISK_USAGE}%"
   fi

   # Check running processes (number of processes)
   PROCESS_COUNT=$(ps aux | wc -l)
   log_message "Current number of running processes: ${PROCESS_COUNT}"
   if (( PROCESS_COUNT > PROCESS_THRESHOLD )); then
       log_message "High number of running processes detected: ${PROCESS_COUNT}"
   fi

   # Log the end of the script
   log_message "System health monitor script completed."
