class people::ironmancris {
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  package {
    [ 
      'tmux',
      'reattach-to-user-namespace', # use tmux to clipboard
      'proctools', # kill by process name, like pkill firefox
      'tig', # text mode interface for git
      'vim',
      'the_silver_searcher'
    ]:
  }
  

  nodejs::module { [ 'jshint', 'jsctags' ]: 
    node_version => 'v0.10' 
  }

  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::finder::show_hidden_files
  include osx::keyboard::capslock_to_control
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps

  #here I have to create a custom class for karabiner to import settings from user-config
  include karabiner
  include flux
  include ohmyzsh
  include iterm2::colors::solarized_dark
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  include skype
  include alfred
  include dropbox
  include sourcetree
  include caffeine
  include tmux
  include dterm
  include vlc
  class { 'vlc': 
    version => '2.1.4'
  }

  #my home config
  repository { $dotfiles_dir:
    source => "ironmancris/user-config"
  }

  file { "${home}/.zshrc":
    ensure => link,
    target => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.tmux.conf":
    ensure => link,
    target => "${dotfiles_dir}/.tmux.conf",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.dircolors":
    ensure => link,
    target => "${dotfiles_dir}/.dircolors",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.vimrc":
    ensure => link,
    target => "${dotfiles_dir}/.vimrc",
    require => Repository[$dotfiles_dir]
  }
  
  file { "${home}/.vim":
    ensure => link,
    target => "${dotfiles_dir}/.vim",
    require => Repository[$dotfiles_dir]
  }

  file { "${home}/.pryrc":
    ensure => link,
    target => "${dotfiles_dir}/.pryrc",
    require => Repository[$dotfiles_dir]
  }

  #configure hosts 
  #include sshuserconfig
  #sshuserconfig::host {
  #  "phybbit":
  #  remote_hostname => "dev01.phybbit.com",
  #  remote_username => "cristiano"
  #} 

  #sshuserconfig::host {
  #  "dev01.phybbit.com":
  #  remote_hostname => "dev01.phybbit.com",
  #  remote_username => "cristiano"
  #} 

  #include all repo projects
  include projects::all_phybbit
}
