# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

def githubsource(name, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, :git => "git://github.com/#{options[:repo]}.git"
end


# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.1.0"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
#general
github "java",           "1.1.2"
github "firefox",        "1.1.3"
github "chrome",         "1.1.1"
github "osx",            "2.7.0"
github "iterm2",         "1.1.2"
github "zsh",            "1.0.0"
github "libreoffice",    "4.2.5" 
github "textmate",       "1.1.0"
github "sublime_text_2", "1.1.2", :repo => "boxen/puppet-sublime_text_2"
github "caffeine",       "1.0.0", :repo => "boxen/puppet-caffeine"

#githubsource "sshuserconfig", :repo => "EugenMayer/boxen-sshuserconfig"

#development
github "imagemagick","1.2.1"
github "mysql",      "1.1.3"
github "redis",      "1.0.0"
github "ohmyzsh",    "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "wget",       "1.0.0"
github "cyberduck",  "1.0.1"
github "mongodb",    "2.6.1"
github "brewcask",   "0.0.5"
github "sourcetree", "1.0.0", :repo => "boxen/puppet-sourcetree"
github "tmux",       "1.0.2", :repo => "boxen/puppet-tmux"

#customization
github "karabiner",  "1.0.6", :repo => "boxen/puppet-karabiner"
github "flux",       "1.0.1", :repo => "boxen/puppet-flux"
github "alfred",     "1.4.0", :repo => "boxen/puppet-alfred"
github "dterm",      "1.0.2", :repo => "boxen/puppet-dterm"

#communication
github "skype",  "1.1.0", :repo => "boxen/puppet-skype"

#file sharing/transfer
github "dropbox",  "1.4.1", :repo => "boxen/puppet-dropbox"

#multimedia
github "vlc",        "1.1.0", :repo => "boxen/puppet-vlc"

