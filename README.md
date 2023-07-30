Kong Ansible
=========
Simple role to start with Kong

__Install Role__
```
ansible-galaxy install bluetoxin.kong
```

__Example Playbook__  

Install and configure kong in dbless mode  
```yaml
roles:
  - role: bluetoxin.kong
    database: "off"
```
Install and configure kong in postgresql mode
```yaml
roles:
  - role: bluetoxin.kong
    pg_host: tests-db-1
    pg_password: kong
```
Create service and route (both dbless and postgresql mode)
```yaml
roles:
  - role: bluetoxin.kong
    <-- here your desired mode (dbless or postgresql) -->
    perform_actions:
      - action: add
        kong_entity: services
        entity_params:
          - name: example_service
            url: http://ifconfig.me
      - action: add
        kong_entity: routes
        entity_params:
          - name: example_route
            service: example_service
            paths:
              - /
              - /example_route
          - name: example_route_2
            service: example_service
            paths:
              - /example_route_two
```
Supported Platforms
-------
+ Ubuntu
+ Alpine (nightly)
+ AmazonLinux (nightly)

Although you can install Kong on Alpine or Amazon Linux hosts, I highly recommend choosing Ubuntu (Jammy/Focal) platforms instead.

License
-------

Apache-2.0 license

