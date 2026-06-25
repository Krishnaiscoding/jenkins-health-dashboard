#!/bin/bash

mkdir -p reports

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEMORY=$(free -m | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
DISK=$(df -h / | awk 'NR==2 {print $5}')

cat <<EOF > reports/report.html
<html>
<head>
<title>Server Health Dashboard</title>
</head>
<body>
<h1>Server Health Dashboard</h1>

<h2>CPU Usage</h2>
<p>$CPU %</p>

<h2>Memory Usage</h2>
<p>$MEMORY %</p>

<h2>Disk Usage</h2>
<p>$DISK</p>

<h2>Top Processes</h2>
<pre>
$(ps aux --sort=-%mem | head -5)
</pre>

<p>Generated: $(date)</p>

</body>
</html>
EOF