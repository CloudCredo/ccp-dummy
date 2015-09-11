#!/bin/bash -ex

env

fail_if_binding_pry_was_left_behind() {
  ! grep --colour -HnR binding\.pry "$PWD"/{config,lib,spec,*.rb,*.ru,*file}
}
fail_if_binding_pry_was_left_behind

bundle install --without development --local --jobs 3

bundle exec rspec
