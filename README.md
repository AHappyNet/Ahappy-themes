# A Happy Theme — ahappy.net

Custom Open edX theme for **A Happy** (ahappy.net) — Online Learning Platform for students.

## Overview

- **Platform:** Open edX (Tutor 21+)
- **Domain:** ahappy.net
- **Color scheme:** Navy blue (#1E3A5F)
- **Languages:** Bilingual Vietnamese & English
- **Dark mode:** Supported with toggle

## Structure

```
├── cms/                    # Studio (CMS) customizations
│   └── static/
│       ├── images/         # Studio logos & favicons
│       └── sass/           # Studio theme variables
├── lms/                    # LMS customizations
│   ├── static/
│   │   ├── fonts/          # IBM Plex Sans, Crimson Text
│   │   ├── images/         # Logos, favicons, icons
│   │   ├── js/             # Dark theme toggle, responsive nav
│   │   └── sass/           # All theme styles
│   └── templates/          # Mako templates
│       ├── header/         # Navigation & branding
│       ├── courseware/      # Course pages
│       ├── static_templates/ # About, Contact, Help, Privacy, TOS
│       └── ...
└── tasks/
    └── init.sh             # Theme assignment script
```

## Installation

```bash
# 1. Clone into Tutor themes directory
git clone https://github.com/AHappyNet/Ahappy-themes.git /tmp/ahappy-themes
cp -r /tmp/ahappy-themes $(tutor config printroot)/env/build/openedx/themes/ahappy-theme

# 2. Mount theme
tutor mounts add lms,cms,lms-worker,cms-worker:$(tutor config printroot)/env/build/openedx/themes/ahappy-theme:/openedx/themes/ahappy-theme

# 3. Assign theme to site
tutor local run lms ./manage.py lms shell -c "
from django.contrib.sites.models import Site
for site in Site.objects.all():
    for theme in site.themes.all():
        theme.theme_dir_name = 'ahappy-theme'
        theme.save()
"

# 4. Restart
tutor local stop
tutor local start -d
```

## Customization

### Social Links
Edit `lms/templates/footer.html` and `lms/templates/courseware/course_about_sidebar_header.html`

### Colors
Edit `lms/static/sass/partials/lms/theme/_variables.scss`

### Logo
Replace `lms/static/images/logo.png` and `lms/static/images/favicon.ico`

## License

Based on the [Indigo theme](https://github.com/overhangio/tutor-indigo) for Open edX.
