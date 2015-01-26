class projects::ec-framework {
  $home = "/Users/${::boxen_user}"
  $dirname = "ec-framework"

  boxen::project { $dirname:
    nginx => true,
    source => 'https://github.com/Phybbit/ec-framework'
  }
}
