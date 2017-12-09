## Files to be changed
### /etc/issue
* Definitely part of ‘config’
* Can be changed just using sed -e 's/ubuntu/cherrytux/gI'

### /etc/issue.net
* Definitely part of ‘config’
* Can be changed just using sed -e 's/ubuntu/cherrytux/gI'

### /etc/dpkg/origins/default
* Symlink - points at /etc/dpkg/origins/ubuntu
* Create new target /etc/dpkg/origins/cherrytux and point at that instead
* This contains Vendor, Vendor URL, bugs URL and Parent
* Change to:
```
    Vendor: Cherrytux
    Vendor-URL: https://github.com/sundarnagarajan/cherrytux
    Bugs URL: https://github.com/sundarnagarajan/cherrytux/issues
    Parent: Ubuntu
```

### /etc/dpkg/origins/ubuntu
* This contains Vendor, Vendor URL, bugs URL and Parent
* Leave unchanged (owned by package base-files) and create new file /etc/dpkg/origins/cherrytux containing:
```
    Vendor: Cherrytux
    Vendor-URL: https://github.com/sundarnagarajan/cherrytux
    Bugs URL: https://github.com/sundarnagarajan/cherrytux/issues
    Parent: Ubuntu
```
* Make /etc/dpkg/origins/default symlink to /etc/dpkg/origins/cherrytux 

### /etc/os-release
Needs a simple script to change (ONLY) the following keys:

* NAME
* PRETTY_NAME
* HOME_URL
* SUPPORT_URL
* BUG_REPORT_URL

I do not THINK the following keys need to be changed:

* ID=ubuntu
* UBUNTU_CODENAME=xenial
