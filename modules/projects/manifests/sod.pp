class projects::sod {
  include imagemagick

  $home = "/Users/${::boxen_user}"
  $dirname = "sod"

  boxen::project { $dirname:
    ruby      => '2.1.0',
    redis     => true,
    nginx     => true,
    source    => 'action-re3-phybbit/website'
  } 
}
