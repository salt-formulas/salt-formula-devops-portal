{%- from "devops_portal/map.jinja" import config with context %}
{%- if config.enabled|default(False) %}

devops_portal_dirs:
  file.directory:
    - names:
      - {{ config.base_dir }}/nginx
      - {{ config.base_dir }}/config
    - user: root
    - group: root
    - mode: 0755
    - makedirs: true

devops_portal_nginx_conf:
  file.managed:
    - name: {{ config.base_dir }}/nginx/nginx.conf
    - source: salt://devops_portal/files/nginx.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - file: devops_portal_dirs

devops_portal_config:
  file.managed:
    - name: {{ config.base_dir }}/config/config.json
    - source: salt://devops_portal/files/config.json
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - file: devops_portal_dirs

{%- endif %}
