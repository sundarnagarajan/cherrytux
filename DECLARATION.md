## Motivation

## Intent

## Sources of information on creating Debian / Ubuntu derivative
* [Ubuntu Derivative Distro HOWTO](https://wiki.ubuntu.com/DerivativeDistroHowto)
* [Debian Derivative distro guidelines](https://wiki.debian.org/Derivatives/Guidelines)

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

    Vendor: Cherrytux
    Vendor-URL: http://www.example.com
    Bugs URL: http://www.example.com/bugs
    Parent: Ubuntu

### /etc/dpkg/origins/ubuntu
* This contains Vendor, Vendor URL, bugs URL and Parent
* Leave unchanged (owned by package base-files) and create new file /etc/dpkg/origins/cherrytux containing:

    Vendor: Cherrytux
    Vendor-URL: http://www.example.com
    Bugs URL: http://www.example.com/bugs
    Parent: Ubuntu
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

## Reporting trademark issues
Please open an issue on this github repository. If possible, label your issue as ```trademark```. The label is already created and ready. Include the following information:
* Which trademark is affected?
* Which file is affected - full path?
* What information do you want removed / changed in the file?
* Are you the owner of the related trademark?

I will make the required changes as soon as possible.
Note: you do **NOT** have to be the owner of the trademark to open this kind of issue. If you simply notice the issue and / or you are more knowledgeable than I am about what needs to be changed, I will be happy to review your suggestion.
