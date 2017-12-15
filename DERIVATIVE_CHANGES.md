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

I have analyzed the following Ubuntu derivatives:

* [Bodhi Linux](http://www.bodhilinux.com/)
* [Elementary OS](https://elementary.io/)
* [Linux Lite](https://www.linuxliteos.com/)
* [Linux Mint](https://linuxmint.com/)
* [Peppermint OS](https://peppermintos.com/)
* [Trisquel](https://trisquel.info/)
* [Pop! OS](https://system76.com/pop)

| Derivative change | [Bodhi](http://www.bodhilinux.com/) | [Elementary](https://elementary.io/) | [Lite](https://www.linuxliteos.com/) | [Mint](https://linuxmint.com/) | [Peppermint](https://peppermintos.com/) | [Trisquel](https://trisquel.info/) | [Pop! OS](https://system76.com/pop)
| ----------------- | --------- | -------------- | -------- | -------- | ------------ | ---------- | --------- |
| /etc/issue | No | Yes | Yes | Yes | Yes | Yes | Yes |
| /etc/issue.net | No | Yes | No | Yes | Yes | Yes | Yes |
|  |  |  |  |  |  |  |  |
| **/etc/dpkg/origins/default** |  |  |  |  |  |  |  |
| Vendor | No | No | No | No | No | Yes | No |
| Vendor-URL | No | No | No | No | No | Yes | No |
| Bugs | No | No | No | No | No | Yes | No |
| Parent | No | No | No | No | No | Yes | No |
| Symlink to | ubuntu | ubuntu | ubuntu | ubuntu | ubuntu | trisquel | pop-os |
|  |  |  |  |  |  |  |  |
| **/etc/os-release** |  |  |  |  |  |  |  |
| NAME | No | Yes | No | Yes | Yes | Yes | Yes |
| VERSION | No | Yes | No | Yes | Yes | Yes | No |
| ID | No | Yes | No | Yes | Yes | Yes | No |
| ID_LIKE | No | Yes | No | Yes | No | No | No |
| PRETTY_NAME | No | Yes | No | Yes | Yes | Yes | Yes |
| VERSION_ID | No | Yes | No | Yes | Yes | Yes | No |
| HOME_URL | No | Yes | No | Yes | Yes | Yes | Yes |
| SUPPORT_URL | No | Yes | No | Yes | Yes | Yes | Yes |
| BUG_REPORT_URL | No | Yes | No | Yes | Yes | Yes | Yes |
| VERSION_CODENAME | No | Yes | No | Yes | Yes |  | No |
| UBUNTU_CODENAME | No | Yes | No | No | No | Missing | No |
| Symlink to | /usr/lib/os-release | /usr/lib/os-release | /usr/lib/os-release | /usr/lib/os-release | /usr/lib/os-release | No | pop-os/os-release |
|  |  |  |  |  |  |  |  |
| **/etc/lsb-relelase**  |  |  |  |  |  |  |  |
| DISTRIB_RELEASE  | No | Yes | No | Yes | Yes | Yes | No |
| DISTRIB_RELEASE | No | Yes | No | Yes | Yes | Yes | No |
| DISTRIB_CODENAME | No | Yes | No | Yes | No | Yes | No |
| DISTRIB_DESCRIPTION | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Symlink to | No | No | No | No | No | No | /etc/pop-os/lsb-release |
|  |  |  |  |  |  |  |  |
| Custom /etc/apt/sources.list | No | No | No |  | No | Yes | No |

