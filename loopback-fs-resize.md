# How to Increase Loopback Filesystem Size

* check current image size  
`$ du -m /path/to/loopback-fs.data`  
`100000	/path/to/loopback-fs.data`

* add 50 GB  
`$ dd if=/dev/zero of=/path/to/loopback-fs.data bs=1M seek=100000 count=50000 conv=sparse`

* fsck to make sure it's clean  
`$ e2fsck -f /path/to/loopback-fs.data`

* resize
`$ resize2fs /path/to/loopback-fs.data`

(adapted from https://www.brain-dump.org/blog/resizing-loop-back-file-systems/)
