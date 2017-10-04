BiolaFrontendToolkit.configure do |config|
  config.app_name = Settings.app.name
  # config.app_version = Version.current  # optional
  config.relative_root = Settings.app.relative_url_root
  # config.release_phase = Settings.release.phase

  # # App Links
  # config.app_links = [
  #   {title: 'Gmail', url: 'http://mail.biola.edu', icon: 'envelope-square'},
  #   {title: 'Forms', url: 'http://forms.biola.edu', icon: 'check-square-o'},
  # ]

  # # Profile Links
  # config.profile_links = [
  #   {title: 'My Account', url: [:my_account, :user], icon: 'user'},
  # ]

  # # Google Analytics   ## Optional ##
  # config.ga_account = 'UA-XXXXXXXX-XX'
  # config.ga_domain = 'biola.edu'
  # config.ga_enabled = true   # defaults to false
end
