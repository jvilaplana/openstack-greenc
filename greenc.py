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

nova = client.Client("jvilaplana", "mypassword", "bigproject", "http://stormy.udl.net:5000/v2.0/", service_type="compute")

print nova.servers.list()

print nova.flavors.list()

# List all the availability zones
av_zones = nova.availability_zones.list()

# List that will contain all the availability zones used by GreenC
greenc_zones = []

for az in range(0, len(av_zones)):
    if av_zones[az].zoneName.startswith("greenc_"):
        greenc_zones.append(av_zones[az])


print av_zones[1].hosts

    #print av_zones[az]
    #print dir(av_zones[az])
    #print av_zones[az].zoneName


#printnova.servers.create("my-server", flavor=fl)
