{%- if pillar.devops_portal is defined %}
include:
{%- if pillar.devops_portal.control is defined %}
  - devops_portal.control
  - devops_portal.setup
{%- endif %}
{%- endif %}
