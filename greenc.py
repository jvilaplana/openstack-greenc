# Copyright 2014 Jordi Vilaplana
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from novaclient.v1_1 import client
import subprocess


CONTROLLER_USER = "root"
CONTROLLER_IP = "10.50.74.1"

HWaddr_C02 = "B4:B5:2F:69:E1:DA"
HWaddr_C03 = "AC:16:2D:BE:2C:30"
HWaddr_C04 = "B4:B5:2F:69:32:56"

PIP_C02 = "10.50.74.2"
PIP_C03 = "10.50.74.3"
PIP_C04 = "10.50.74.4"

IP_C02 = "192.168.0.2"
IP_C03 = "192.168.0.3"
IP_C04 = "192.168.0.4"

nova = client.Client("jvilaplana", "jvilaplana", "bigproject", "http://stormy.udl.net:5000/v2.0/", service_type="compute")


def shutdown_host(username, ip):
    host = username + '@' + ip
    subprocess.call(["ssh", host, "poweroff"]);

def startup_host(hwaddr):
    subprocess.call(["ssh", CONTROLLER_USER + '@' + CONTROLLER_IP, "wol " + hwaddr]);


def main():
    startup_host(HWaddr_C02)
    #shutdown_host("root", PIP_C02)
    
    print "### SERVERS ###"
    print nova.servers.list()

    print "### FLAVORS ###"
    print nova.flavors.list()

    print "### HOSTS ###"
    print nova.hosts.list()

    host_list = nova.hosts.list()

    #print dir(nova.hosts)

    #print dir(nova)

    for host in host_list:
        print "HOST:"
        print host.host_name
        if host.host_name == "stormyc04.udl.net":
            pass
            #host.shutdown
            #nova.hosts.host_action(host, "shutdown")
            #print dir(nova.hosts)
            #nova.hosts.host_action(host.host_name, "shutdown")

    #print nova.hosts.list()

    # List all the availability zones
    #av_zones = nova.availability_zones.list()

    # List that will contain all the availability zones used by GreenC
    #greenc_zones = []

    #for az in range(0, len(av_zones)):
    #    if av_zones[az].zoneName.startswith("greenc_"):
    #        greenc_zones.append(av_zones[az])


    #print av_zones[1].hosts



        #print av_zones[az]
        #print dir(av_zones[az])
        #print av_zones[az].zoneName


    #printnova.servers.create("my-server", flavor=fl)

if __name__ == "__main__":
    main()
