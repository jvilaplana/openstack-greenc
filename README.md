openstack-greenc
================

OpenStack GreenC: A Power-Aware Virtual Machine Scheduling Policy for OpenStack Clouds


## Development Environment

- Install Python
- Install nova-client: sudo pip install python-novaclient


### greenc_scheduler.py

- Add file to /usr/lib/python2.6/site-packages/nova/scheduler/greenc_scheduler.py
- Edit /etc/nova/nova.conf:

```
# Default driver to use for the scheduler (string value)
#scheduler_driver=nova.scheduler.filter_scheduler.FilterScheduler
# jordi
# scheduler_driver=nova.scheduler.greenc_scheduler.GreenCScheduler
```

- Restart service: service openstack-nova-scheduler restart
- Check log: tail -f /var/log/nova/scheduler.log
