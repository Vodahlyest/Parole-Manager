parolemanager_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'password_creator.vala',
  'password_view.vala',
]

parolemanager_deps = [
  dependency('gtk4'),
  dependency('gee-0.8'),
  dependency('libadwaita-1', version: '>= 1.2'),
]

parolemanager_sources += gnome.compile_resources('parolemanager-resources',
  'parolemanager.gresource.xml',
  c_name: 'parolemanager'
)

executable('Parolemanager', parolemanager_sources,
  dependencies: parolemanager_deps,
       install: true,
)
