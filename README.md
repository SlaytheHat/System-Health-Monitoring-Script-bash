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

This script uses standard tools that are typically pre-installed on most Linux distributions. However, some of the functionality (like sending emails) may require additional configuration or packages. Here's a breakdown of potential requirements:

---

### Tools and Commands Used
1. **`top`**: Used to get CPU usage.  
   - Pre-installed on most Linux distributions.

2. **`free`**: Used to check memory usage.  
   - Pre-installed on most Linux distributions.

3. **`df`**: Used to check disk usage.  
   - Pre-installed on most Linux distributions.

4. **`awk`**, **`sed`**, **`bc`**: Used for text processing and calculations.  
   - Pre-installed on most Linux distributions.

5. **`mail`** (or `mailx`): Used to send email alerts.  
   - **May require installation**:
     - On Debian/Ubuntu: `sudo apt install mailutils`
     - On Red Hat/CentOS/Fedora: `sudo yum install mailx` or `sudo dnf install mailx`
   - **Note**: `mail` also needs a working mail server configuration (e.g., `sendmail`, `Postfix`, or external SMTP).

6. **Network Statistics** (`/sys/class/net`):
   - This script assumes the use of the `eth0` interface. Adjust the interface name as needed (e.g., `enp0s3` for modern systems).

---

### Optional Recommendations
1. **Ensure `mail` Configuration**:
   - If email alerts are required, configure an SMTP server on the system, or use a service like Gmail with proper authentication.

2. **Real-Time Monitoring Enhancements**:
   - For real-time monitoring, you might want to install tools like `htop` or `glances` for advanced visualization.

3. **System Log Rotation**:
   - If the script runs frequently, consider implementing a log rotation tool like `logrotate` to manage the `system_health.log` file size.
