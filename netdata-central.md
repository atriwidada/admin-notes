setup ref: https://blog.netdata.cloud/why-is-data-replication-important/

## On parent node
/etc/netdata/netdata.conf
```
[global]
    run as user = netdata

    # default storage size - increase for longer data retention
    page cache size = 32
[db]
    mode = dbengine
    
    # per second data collection
    update every = 1

    # to allow memory pressure to offload index from ram
    dbengine page descriptors in file mapped memory = yes
    
    # number of tiers used (1 to 5, 3 being default)
    storage tiers = 3
    
    # Tier 0, per second data
    dbengine multihost disk space MB = 12000
    dbengine page cache size MB = 1400
    
    # Tier 1, per minute data
    dbengine tier 1 page cache size MB = 512
    dbengine tier 1 multihost disk space MB = 4096
    dbengine tier 1 update every iterations = 60
    dbengine tier 1 backfill = new
    
    # Tier 2, per hour data
    dbengine tier 2 page cache size MB = 128
    dbengine tier 2 multihost disk space MB = 2048
    dbengine tier 2 update every iterations = 60
    dbengine tier 2 backfill = new
```

/etc/netdata/stream.conf
```
[UUID-to-be-referred-by-child-nodes]
    enabled = yes
    default memory mode = dbengine
    allow from = *
```

## On child node

/etc/netdata/netdata.conf
```
[db]
    # https://learn.netdata.cloud/docs/agent/database
    # none = no retention, alloc = some retention in ram
    mode = alloc
    # in case of alloc, retention in seconds
    # how much tolerance the child has to find a parent in order to transfer the data
    # for IoT can be lowered to 120
    retention = 1200
    # you may increase this to lower CPU resources
    update every = 1
[ml]
    # disable Machine Learning
    enabled = no
[health]
    # disable Health Checks
    enabled = no
[web]
    # disable local dashboard
    bind to = lo
```
/etc/netdata/stream.conf
```
[stream]
	enabled = yes
	destination = put.parent.ip.here:19999
	api key = UUID-copy-from-parent
```
