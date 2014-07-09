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


### Documentation

http://docs.openstack.org/trunk/config-reference/content/section_compute-scheduler.html

http://docs.openstack.org/openstack-ops/content/customize.html

http://docs.openstack.org/trunk/config-reference/content/list-of-compute-config-options.html

http://docs.openstack.org/developer/python-novaclient/ref/v1_1/servers.html

http://docs.openstack.org/developer/python-novaclient/api/novaclient.v1_1.servers.html

http://docs.openstack.org/developer/python-novaclient/ref/v1_1/availability_zones.html

http://www.sebastien-han.fr/blog/2013/03/18/grizzly-availability-zones/

http://www.sebastien-han.fr/blog/2013/01/24/openstack-nova-play-with-availability-zones/

http://docs.openstack.org/trunk/config-reference/content/list-of-compute-config-options.html

