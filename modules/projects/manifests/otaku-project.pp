class projects::otaku-project {
  $home = "/Users/${::boxen_user}"
  $dirname = "otaku-project"

  boxen::project { $dirname:
    redis => true,
    nginx => true,
    source => 'https://github.com/Phybbit/otaku-server'
  }
}
