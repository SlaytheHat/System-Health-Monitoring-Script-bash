```bash
#!/bin/bash

# Configuration
LOG_FILE="LOG_FILE="/var/log/system_health.log"
EMAIL_ALERT="youremail@example.com"
CPU_THRESHOLD=80  # in percentage
MEMORY_THRESHOLD=80  # in percentage
DISK_THRESHOLD=80  # in percentage

# Function to check CPU usage
check_cpu_usage() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU_USAGE%"
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "Warning: High CPU usage detected!" | tee -a $LOG_FILE
        echo "CPU usage is above threshold ($CPU_USAGE%)" | mail -s "High CPU Usage Alert" $EMAIL_ALERT
    fi
}

# Function to check memory usage
check_memory_usage() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $MEMORY_USAGE%"
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "Warning: High Memory usage detected!" | tee -a $LOG_FILE
        echo "Memory usage is above threshold ($MEMORY_USAGE%)" | mail -s "High Memory Usage Alert" $EMAIL_ALERT
    fi
}

# Function to check disk usage
check_disk_usage() {
    DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    echo "Disk Usage: $DISK_USAGE%"
    if (( DISK_USAGE > DISK_THRESHOLD )); then
        echo "Warning: High Disk usage detected!" | tee -a $LOG_FILE
        echo "Disk usage is above threshold ($DISK_USAGE%)" | mail -s "High Disk Usage Alert" $EMAIL_ALERT
    fi
}

# Function to check network activity
check_network_activity() {
    RX_BYTES=$(cat /sys/class/net/eth0/statistics/rx_bytes)
    TX_BYTES=$(cat /sys/class/net/eth0/statistics/tx_bytes)
    echo "Network Activity: Received = $RX_BYTES bytes, Transmitted = $TX_BYTES bytes"
}

# Main function
monitor_system() {
    echo "System Health Report - $(date)" | tee -a $LOG_FILE
    check_cpu_usage | tee -a $LOG_FILE
    check_memory_usage | tee -a $LOG_FILE
    check_disk_usage | tee -a $LOG_FILE
    check_network_activity | tee -a $LOG_FILE
    echo "---------------------------------------------------" | tee -a $LOG_FILE
}

# Run the script
if [[ "$1" == "--live" ]]; then
    while true; do
        clear
        monitor_system
        sleep 5
    done
else
    monitor_system
fi
```
