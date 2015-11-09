Statsite – Ansible Role
=========
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-statsite.svg?style=flat-square)](https://github.com/mtchavez/ansible-statsite/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-statsite.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-statsite)


Ansible role to manage the installation and setup of [Statsite][1].

Requirements
------------

Ansible 1.7 or greater. A working Python install of 2.7 or greater to build.

Role Variables
--------------

Useful variables that you may want to override. The configuration can also be
managed in your own role using the `ini` ansible module or writing your own
template out.

```
statsite_name: "statsite"
statsite_version: "0.7.1"
statsite_package_url: "https://github.com/armon/statsite/archive/v{{statsite_version}}.tar.gz"
statsite_install_script: "/usr/local/bin/install_statsite"
statsite_binary_path: "/usr/local/bin/statsite{{statsite_version}}"
statsite_etc_dir: "/etc/statsite"
statsite_config_file: "{{statsite_etc_dir}}/{{statsite_name}}.conf"
statsite_log_file: "/var/log/{{statsite_name}}.log"
statsite_upstart_file: "/etc/init/{{statsite_name}}.conf"
statsite_logrotate_file: "/etc/logrotate.d/{{statsite_name}}"
statsite_group: "statsite"
statsite_user: "{{statsite_group}}"

#
# Config
#

# [statsite]
statsite_port: 8125
statsite_udp_port: 8125
statsite_log_level: "WARN"
statsite_flush_interval: 10
statsite_timer_eps: 0.01
statsite_set_eps: 0.02
statsite_stream_cmd: ""
statsite_daemonize: 0
statsite_binary_stream: false
statsite_pid_dir: "/var/run/statsite"
statsite_pidfile: "{{statsite_pid_dir}}/{{statsite_name}}.pid"
```

Dependencies
------------

No role dependencies.

Example Playbook
----------------

Using the role in a playbook is as simple as adding the role. Pass in variables
you want to override or you can manage the statsite config in a separate role.

    - hosts: servers
      roles:
         - role: mtchavez.statsite
         - { role: mtchavez.statsite, statsite_version: "1.7.0" }

License
-------

MIT

Author Information
------------------

El Chavo - mtchavez - 2015

[1]: https://github.com/armon/statsite
