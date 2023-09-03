---
Date: 2023-08-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Python - Run Network Speedtest" ]
---

# Python - Run Network Speedtest

> [!NOTE] About
> 

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```python
# First, you need to install the required module.
# You can choose any of the following options:
# pip install pyspeedtest
# pip install speedtest
# pip install speedtest-cli

import speedtest
import pyspeedtest

def test_internet_speed():
    # Using speedtest module
    speed_test = speedtest.Speedtest()
    best_server = speed_test.get_best_server()
    print(f"Best server: {best_server['host']} located in {best_server['country']}")

    download_speed = speed_test.download() / 1_000_000  # Convert to Mbps
    print(f"Download speed: {download_speed:.2f} Mbps")

    upload_speed = speed_test.upload() / 1_000_000  # Convert to Mbps
    print(f"Upload speed: {upload_speed:.2f} Mbps")

    # Using pyspeedtest module
    pst = pyspeedtest.SpeedTest()
    ping_speed = pst.ping()
    print(f"Ping speed: {ping_speed} ms")

if __name__ == "__main__":
    test_internet_speed()
```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-08-12]] and last modified on [[2023-08-12]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[Python - Run Network Speedtest]] AND -"CHANGELOG" AND -"Code/Python/Python - Run Network Speedtest"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

