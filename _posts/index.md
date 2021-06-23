---
layout: post
title: "Generic Help"
tags: ["utf-8"]
---

## Network

### In windows:

```batch
bcdedit /set hypervisorlaunchtype off
bcdedit /set hypervisorlaunchtype auto
```

## rclone

```bash
curl https://rclone.org/install.sh | sudo bash -s beta

~\.config\rclone
rclone sync bkpmon: /bkp   # download
rclone sync bkp bkpmon:    # sync upload
rclone copy bkp bkpmon:    # only upload
```
