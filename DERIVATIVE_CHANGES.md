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

### /usr/lib/os-release
I do not think any changes to this file are required. I believe only ```/etc/os-release``` - which is originally a copy of this file - is used.

I have analyzed 6 Ubuntu derivatives, and the results from these distributions are below:

* [Bodhi Linux](http://www.bodhilinux.com/)
* [Elementary OS](https://elementary.io/)
* [Linux Lite](https://www.linuxliteos.com/)
* [Linux Mint](https://linuxmint.com/)
* [Peppermint OS](https://peppermintos.com/)
* [Trisquel](https://trisquel.info/)

| Derivative change | [Bodhi](http://www.bodhilinux.com/) | [Elementary](https://elementary.io/) | [Lite](https://www.linuxliteos.com/) | [Mint](https://linuxmint.com/) | [Peppermint](https://peppermintos.com/) | [Trisquel](https://trisquel.info/) |
| ----------------- | --------- | -------------- | -------- | -------- | ------------ | ---------- |
| /etc/issue | No | Yes | Yes | Yes | Yes | Yes |
| /etc/issue.net | No | Yes | No | Yes | Yes | Yes |
|  |  |  |  |  |  |  |
| /etc/dpkg/origins/default : Vendor | No | No | No | No | No | Yes |
| /etc/dpkg/origins/default : Vendor-URL | No | No | No | No | No | Yes |
| /etc/dpkg/origins/default : Bugs | No | No | No | No | No | Yes |
| /etc/dpkg/origins/default : Parent | No | No | No | No | No | Yes |
| /etc/dpkg/origins/default points at | ubuntu | ubuntu | ubuntu | ubuntu | ubuntu | trisquel |
|  |  |  |  |  |  |  |
| /etc/os-release : NAME | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : VERSION | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : ID | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : ID_LIKE | No | Yes | No | Yes | No | No |
| /etc/os-release : PRETTY_NAME | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : VERSION_ID | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : HOME_URL | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : SUPPORT_URL | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : BUG_REPORT_URL | No | Yes | No | Yes | Yes | Yes |
| /etc/os-release : VERSION_CODENAME | No | Yes | No | Yes | Yes |  |
| /etc/os-release : UBUNTU_CODENAME | No | Yes | No | No | No | Missing |
|  |  |  |  |  |  |  |
| /etc/os-release symlink to /usr/lib/os-release | Yes | Yes | Yes | Yes | Yes | No |
|  |  |  |  |  |  |  |




