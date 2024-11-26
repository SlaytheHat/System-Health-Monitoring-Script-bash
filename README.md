# System-Health-Monitoring-Script-bash-Copy-code
This script collects and displays CPU, memory, disk, and network usage in a user-friendly format. It also logs this information to a file and sends email alerts if thresholds are exceeded.

### How to Use:
1. Save the script as `system_health.sh` and make it executable:
   ```bash
   chmod +x system_health.sh
   ```
2. Run it once to generate a report:
   ```bash
   ./system_health.sh
   ```
3. Use the `--live` flag for continuous real-time monitoring:
   ```bash
   ./system_health.sh --live
   ```
4. Customize the thresholds and email in the configuration section as needed.

### What It Does:
- Monitors CPU, memory, disk, and network usage.
- Logs reports with timestamps to `system_health.log`.
- Sends email alerts for high CPU, memory, or disk usage.
