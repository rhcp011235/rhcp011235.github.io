---
layout: post
title:  "Amazon FireTv Partial Unlock"
date:   2015-02-18
categories: android bootloader firetv
---

Well, I guess to start off, I have reversed this method from a exploit posted by Rbox which was actually a bug found by jcase. This was posted on XDA as a binary and I just had to know how it worked. So, Its time for some IDA!

Part 1 (Looking at the original closed source version)
------------------

First thing I noticed is that it was reading the Aboot, So, naturally, I would grab a STOCK Aboot and a Patched Aboot, with further examination, it was quite clear that is was simply a one bit change. Who would think right?

---
### ABOOT

Stock Header of the Aboot:

```c
ANDROID-BOOT!\0\0\0\0\0\0\0
```

Patched Header of Aboot:

```c
ANDROID-BOOT!\0\0\0\1\0\0\0
```

as we can see now, its simply a one bit change.


Part 2 (How to Unlock your boot-loader using my open-source tool!)
------------------

---
I am not responsible for any damage that may happen to any devices because of this method. I have only tested this on my own device running the recommended firmware.  If you do not follow this guide ```exactly```, you 
WILL permanently brick your device. No restore, will help you if you mess up. Good luck!

1. Got Root?
You need root for this process to work. If you do not have root, You will need to get <a href="https://towelroot.com/tr.apk">towelroot</a> 

2. Get my open-source code/tool

```c
git clone https://github.com/rhcp011235/firetv_bootloader_unlock.git
```

3. Time to Unlock


```c
cd firetv_bootloader_unlock
cd binary
adb push unlock_firetv /data/local/tmp/
adb shell
su
cd /data/local/tmp/
chmod 755 unlock_firetv
./unlock_firetv check
./unlock_firetv unlock
```

Reboot and and if you are lucky ;) you now have an unlocked FireTV
