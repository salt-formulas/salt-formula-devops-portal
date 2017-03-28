DevOps Portal
=============

The DevOps Portal provides dashboards and services to boost operational and
support needs.

Sample pillars
~~~~~~~~~~~~~~

The DevOps Portal supports only predefined set of services, add services into
pillars to make them accessable from the portal. For example let's consider
how to add a Jenkins service:

.. code-block:: yaml

    devops_portal:
      config:
        service:
          jenkins:
            endpoint:
              address: 172.16.10.254
              port: 8081
              https: true
