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

"""
The OpenStack GreenC Project
============================

OpenStack GreenC is a project to schedule
Virtual Machines to lower energy consumption.
"""

from setuptools import setup, find_packages


setup(
    name='GreenC',
    version='0.1',
    description='GreenC VM Policy for OpenStack',
    author='Jordi Vilaplana',
    author_email='gatasuna@gmail.com',
    url='https://github.com/jvilaplana/openstack-greenc/',
    platforms='any',
    license='LICENSE',
    packages=find_packages(),
)
