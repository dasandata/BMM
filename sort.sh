

pdsh -w compute-0-[0-15] 'uptime'  | sort -k 3 -t "-" -h

compute-0-0:  19:28:20 up 495 days,  6:13,  0 users,  load average: 16.18, 16.20, 16.13
compute-0-1:  19:28:20 up 495 days,  6:13,  0 users,  load average: 16.00, 16.00, 16.00
compute-0-2:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.23, 16.16, 16.10
compute-0-3:  19:28:20 up 293 days,  7:47,  0 users,  load average: 16.23, 16.16, 16.08
compute-0-4:  19:28:20 up 291 days,  6:23,  0 users,  load average: 16.02, 16.01, 16.00
compute-0-5:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.00, 16.01, 16.00
compute-0-6:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.00, 16.00, 16.00
compute-0-7:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.19, 16.18, 16.11
compute-0-8:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.00, 16.00, 16.00
compute-0-9:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.02, 16.02, 16.00
compute-0-10:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.00, 16.00, 16.00
compute-0-11:  19:28:20 up 495 days,  6:11,  0 users,  load average: 16.00, 16.00, 16.00
compute-0-12:  19:28:20 up 495 days,  6:12,  0 users,  load average: 16.16, 16.03, 16.01
compute-0-13:  19:28:20 up 495 days,  6:08,  0 users,  load average: 16.19, 16.18, 16.21
compute-0-14:  19:28:20 up 193 days,  1:51,  0 users,  load average: 16.20, 16.05, 16.01
compute-0-15:  19:28:20 up 68 days,  9:07,  0 users,  load average: 16.18, 16.19, 16.11
