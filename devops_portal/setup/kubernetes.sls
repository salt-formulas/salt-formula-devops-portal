{%- from "devops_portal/map.jinja" import control with context %}
{%- if control.setup.engine == "kubernetes" %}
{%- set namespace = control.setup.kubernetes.namespace|default("oss") %}

devops_portal_kubernetes_dir:
  file.directory:
    - name: /srv/oss/devops_portal/kubernetes
    - user: root
    - group: root
    - mode: 0755
    - makedirs: true

devops_portal_k8s_svc:
  file.managed:
    - name: /srv/oss/devops_portal/kubernetes/devops_portal-svc.yaml
    - source: salt://devops_portal/files/kubernetes/devops_portal-svc.yaml
    - template: jinja
    - require:
      - file: devops_portal_kubernetes_dir

devops_portal_k8s_cm:
  file.managed:
    - name: /srv/oss/devops_portal/kubernetes/devops_portal-cm.yaml
    - source: salt://devops_portal/files/kubernetes/devops_portal-cm.yaml
    - template: jinja
    - require:
      - file: devops_portal_kubernetes_dir
      - file: devops_portal_nginx_conf
      - file: devops_portal_config

devops_portal_k8s_deploy:
  file.managed:
    - name: /srv/oss/devops_portal/kubernetes/devops_portal-deploy.yaml
    - source: salt://devops_portal/files/kubernetes/devops_portal-deploy.yaml
    - template: jinja
    - require:
      - file: devops_portal_kubernetes_dir
      - file: devops_portal_k8s_cm

devop_portal_namespace:
  cmd.run:
    - name: hyperkube kubectl create namespace {{ namespace }}
    - unless: hyperkube kubectl get namespaces {{ namespace }}

apply_devops_portal:
  cmd.run:
    - name: hyperkube kubectl apply
            --filename /srv/oss/devops_portal/kubernetes/devops_portal-svc.yaml
            --filename /srv/oss/devops_portal/kubernetes/devops_portal-cm.yaml
            --filename /srv/oss/devops_portal/kubernetes/devops_portal-deploy.yaml
            --namespace={{ namespace }}
            --record
    - require:
      - cmd: devop_portal_namespace
      - file: devops_portal_k8s_svc
      - file: devops_portal_k8s_cm
      - file: devops_portal_k8s_deploy

{%- endif %}
