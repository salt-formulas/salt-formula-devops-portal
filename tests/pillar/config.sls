devops_portal:
  config:
    enabled: true
    service:
      elasticsearch:
        configure_proxy: true
        endpoint:
          address: 10.20.0.4
          port: 9200
          https: false
      jenkins:
        endpoint:
          address: 10.20.0.3
          port: 8282
          https: false
      pushkin:
        configure_proxy: true
        endpoint:
          address: 10.20.0.2
          port: 8887
          https: false
      rundeck:
        configure_proxy: true
        endpoint:
          address: 10.20.0.1
          port: 4440
          https: false
