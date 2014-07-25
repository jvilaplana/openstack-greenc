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
import time


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

compute01_vcpu_total = 32
compute02_vcpu_total = 32
compute03_vcpu_total = 32
compute04_vcpu_total = 32

compute01_vcpu_used = 0
compute02_vcpu_used = 0
compute03_vcpu_used = 0
compute04_vcpu_used = 0

compute01_ram_total = 110 * 1024
compute02_ram_total = 110 * 1024
compute03_ram_total = 110 * 1024
compute04_ram_total = 110 * 1024

compute01_ram_used = 0
compute02_ram_used = 0
compute03_ram_used = 0
compute04_ram_used = 0

nova = client.Client("jvilaplana", "jvilaplana", "bigproject", "http://stormy.udl.net:5000/v2.0/", service_type="compute")


def shutdown_host(username, ip):
    host = username + '@' + ip
    subprocess.call(["ssh", host, "poweroff"]);

def startup_host(hwaddr):
    subprocess.call(["ssh", CONTROLLER_USER + '@' + CONTROLLER_IP, "wol " + hwaddr]);

def list_servers():
    return nova.servers.list()
    #for server in servers:
    #    print server.name + " - " + nova.hosts.get(server.hostId).host_name
        #print dir(server)

def list_flavors():
    print nova.flavors.list()

def list_hosts():
    return nova.hosts.list()
    #for host in hosts:
    #    print host.host_name

def list_images():
    return nova.images.list()

def list_servers_and_host():
    servers = list_servers()
    hosts = list_hosts()

    for server in servers:
        server_host = ""
        for host in hosts:
            #print dir(host)
            #print dir(server)
            #print host.hostId
            #print host.id
            if host.human_id == server.hostId:
                server_host = host.host_name
                break
        print server.name + " - " + server.hostId

def test2():
    m1_tiny = 4
    m1_small = 8
    m1_medium = 16
    m1_large = 6
    m1_xlarge = 3

    flavor_tiny = nova.flavors.find(ram=512)
    flavor_small = nova.flavors.find(ram=2048)
    flavor_medium = nova.flavors.find(ram=4096)
    flavor_large = nova.flavors.find(ram=8192)
    flavor_xlarge = nova.flavors.find(ram=16384)

    for x in range(0, m1_xlarge):
        instance_name = "xlarge-" + str(x)
        allocated = allocate_vm(instance_name, 8, 16384, flavor_xlarge)
        print "- VM " + instance_name + " allocated in: " + allocated

    for x in range(0, m1_large):
        instance_name = "large-" + str(x)
        allocated = allocate_vm(instance_name, 4, 8192, flavor_large)
        print "- VM " + instance_name + " allocated in: " + allocated

    for x in range(0, m1_medium):
        instance_name = "medium-" + str(x)
        allocated = allocate_vm(instance_name, 2, 4096, flavor_medium)
        print "- VM " + instance_name + " allocated in: " + allocated

    for x in range(0, m1_small):
        instance_name = "small-" + str(x)
        allocated = allocate_vm(instance_name, 1, 2048, flavor_small)
        print "- VM " + instance_name + " allocated in: " + allocated
    
    for x in range(0, m1_tiny):
        instance_name = "tiny-" + str(x)
        allocated = allocate_vm(instance_name, 1, 512, flavor_tiny)
        print "- VM " + instance_name + " allocated in: " + allocated

    if(compute02_vcpu_used == 0):
        print "shutting down compute02 ..."
        shutdown_host("root", PIP_C02)
    if(compute03_vcpu_used == 0):
        print "shutting down compute03 ..."
        shutdown_host("root", PIP_C03)
    if(compute04_vcpu_used == 0):
        print "shutting down compute04 ..."
        shutdown_host("root", PIP_C04)
    
        
    
def allocate_vm(instance_name, vcpu, ram, flavor):
    image = list_images()[0]

    global compute01_vcpu_used
    global compute02_vcpu_used
    global compute03_vcpu_used
    global compute04_vcpu_used
    
    global compute01_ram_used
    global compute02_ram_used
    global compute03_ram_used
    global compute04_ram_used

    if compute01_vcpu_used + vcpu < compute01_vcpu_total and compute01_ram_used + ram < compute01_ram_total:
        nova.servers.create(instance_name, image=image, flavor=flavor, availability_zone="compute01", keypair="jvilaplana")
        compute01_vcpu_used += vcpu
        compute01_ram_used += ram
        return "compute01"
    elif compute02_vcpu_used + vcpu < compute02_vcpu_total and compute02_ram_used + ram < compute02_ram_total:
        nova.servers.create(instance_name, image=image, flavor=flavor, availability_zone="compute02", keypair="jvilaplana")
        compute02_vcpu_used += vcpu
        compute02_ram_used += ram
        return "compute02"
    elif compute03_vcpu_used + vcpu < compute03_vcpu_total and compute03_ram_used + ram < compute03_ram_total:
        nova.servers.create(instance_name, image=image, flavor=flavor, availability_zone="compute03", keypair="jvilaplana")
        compute03_vcpu_used += vcpu
        compute03_ram_used += ram
        return "compute03"
    elif compute04_vcpu_used + vcpu < compute04_vcpu_total and compute04_ram_used + ram < compute04_ram_total:
        nova.servers.create(instance_name, image=image, flavor=flavor, availability_zone="compute04", keypair="jvilaplana")
        compute04_vcpu_used += vcpu
        compute04_ram_used += ram
        return "compute04"
    else:
        return "error"


def test3():
    image = list_images()[0]
    flavor_tiny = nova.flavors.find(ram=512)

    #nova.servers.create("prova", image=image, flavor=flavor_tiny, availability_zone="compute02", keypair="jvilaplana")
 
    for i in range(38, 100):
        instance_name = "vm-test3-" + str(i)
        print "- Launching " + instance_name + "..."
        nova.servers.create(instance_name, image=image, flavor=flavor_tiny, availability_zone="compute02", keypair="jvilaplana")
        time.sleep(1)

def main():
    test2()
    #test3()
    #startup_host(HWaddr_C04)
    #startup_host(HWaddr_C02)
    #shutdown_host("root", PIP_C04)

    #image = list_images()[0]
    
    #f1 = nova.flavors.find(ram=16384)
    #nova.servers.create("my-server1", image=image, flavor=f1, availability_zone="compute02", keypair="jvilaplana")
    #nova.servers.create("my-server2", image=image, flavor=f1, availability_zone="compute02", keypair="jvilaplana")
    #nova.servers.create("my-server3", image=image, flavor=f1, availability_zone="compute02", keypair="jvilaplana")
    #nova.servers.create("my-server5", image=image, flavor=f1, availability_zone="compute02", keypair="jvilaplana")

    

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
