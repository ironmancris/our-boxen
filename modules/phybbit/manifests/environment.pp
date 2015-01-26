
class phybbit::environment {
  include textmate::textmate2::release
  include java
  include firefox
  include chrome
  include iterm2::stable
  include zsh
  include mysql
  include wget
  include cyberduck
  include brewcask
  
  package {
    [
      'ctags',
    ]:
  }
}
