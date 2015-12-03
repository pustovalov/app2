name "vagrant"
description "setup for ruby on rails core development"
run_list(
  "recipe[apt]",
  "recipe[postgresql::server]",
  "recipe[postgresql::client]",
  "recipe[nodejs]",
  "recipe[ruby_build]",
  "recipe[rvm::system]",
  "recipe[rvm::vagrant]",
  "recipe[database]",
  "recipe[postinstall]"
)
default_attributes(
  "build_essential" => {
    "compiletime" => true
  }
)