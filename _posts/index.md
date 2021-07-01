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
rclone config create bkpmon dropbox [client_id = ] [client_secret = ]

~\.config\rclone
rclone sync bkpmon: /bkp   # download
rclone sync bkp bkpmon:    # sync upload
rclone copy /tmp/bkp bkpmon:/tmp    # only upload
```

