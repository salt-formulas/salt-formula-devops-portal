{%- if pillar.devops_portal is defined %}
include:
{%- if pillar.devops_portal.config is defined %}
  - devops_portal.config
{%- if pillar.devops_portal.setup is defined %}
  - devops_portal.setup
{%- endif %}
{%- endif %}
{%- endif %}
