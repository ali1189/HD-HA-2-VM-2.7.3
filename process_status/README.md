# process_status_exporter from "https://github.com/cauwulixuan/process_status_exporter"
A prometheus exporter to scrape process status including CPU, Memory, Create time, process state and so on.

Usage: python process_status_exporter.py process_info.txt

You can simply change the process_info.txt file to add or remove the process name you want to monitor.

# In my case:

I added to the code to check directories where hadoop services PID "/tmp"
Requirments:

- yum install python-pip python-devel -y && yum groupinstall 'development tools' -y
- pip install --upgrade psutil
- pip install prometheus_client

# You can edit port exporter from process_status_exporter.py like our case to get metrics for different machies:
        help='Listen to this port. (default ":9108")',
        default=int(os.environ.get('VIRTUAL_PORT', '9108'))

# To keep exporting metrics we need to creat a cron job for this 

	- crontab -e
             
		* * * * *  root python /root/process_status_exporter/process_status_exporter.py
	
	- systemctl start crond

# Check metrics Your-IP/9108
