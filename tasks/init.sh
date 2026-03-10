# Assign theme to all sites
./manage.py lms shell -c "
import sys
from django.contrib.sites.models import Site
def assign_theme(domain):
    site, _ = Site.objects.get_or_create(domain=domain)
    if not site.themes.exists():
        site.themes.create(theme_dir_name='ahappy-theme')
    else:
        for theme in site.themes.all():
            if theme.theme_dir_name != 'ahappy-theme':
                theme.theme_dir_name = 'ahappy-theme'
                theme.save()

assign_theme('ahappy.net')
assign_theme('ahappy.net:8000')
assign_theme('studio.ahappy.net')
assign_theme('studio.ahappy.net:8001')
print('Theme ahappy-theme assigned to all sites!')
"
