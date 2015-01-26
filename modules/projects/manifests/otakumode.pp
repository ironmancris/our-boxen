class projects::otakumode {
  include imagemagick

  $home = "/Users/${::boxen_user}"
  $dirname = "otakumode"

  nodejs::module { 
    ['coffee-script', 'node-dev']:
    node_version => 'v0.10'
  }

  boxen::project { $dirname:
    ruby      => '2.0.0',
    redis     => true,
    nodejs    => 'v0.10',
    nginx     => true,
    mongodb   => true,
    phantomjs => '1.9.0',
    source    => 'tokyootakumode/com'
  } 
}
