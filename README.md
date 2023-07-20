Role Name
=========

Simple role to install and set up Kong.

Dependencies
------------

You may need a postgresql role if you want to set up Kong in PostgreSQL mode. If you set it up in DBless mode, there are no special requirements.  

Role Variables
--------------

1) "kong_version" defines version to be installed
2) "kong_url" defines url form which you fetch package
3) add settable variables from kong.conf (https://github.com/Kong/kong/blob/master/kong.conf.default)

Example Playbook
----------------

Install and configure kong in dbless mode
roles:
  - role: kong
    database: "off"

Install and configure kong in postgresql mode
roles:
  - role: kong
    pg_host: tests-db-1
    pg_password: kong

Create service and route (both dbless and postgresql mode)
roles:
  - role: kong
    <-- here your desired mode -->
    perform_actions:
      - action: add
        kong_entity: services
        entity_name: example_service
        entity_params:
          url: http://ifconfig.me
      - action: add
        kong_entity: routes
        entity_name: example_route
        entity_params:
          service:
            name: example_service
          paths:
            - /
            - /example_route

Remove kong entity (both dbless and postgresql mode)
roles:
  - role: kong
    <-- here your desired mode -->
    perform_actions:
      - action: remove
        kong_entity: services
        entity_name: example_service

Install kong (in postgresql mode)
Before that you need to install postgresql, create user "kong" with password "kong" and database "kong" owned by "kong".

Create service and route (in postgresql mode)

Remove kong entity (in postgresql mode)




License
-------

Apache-2.0 license

