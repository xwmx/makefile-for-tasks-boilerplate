#!/usr/bin/env bats
###############################################################################
# makefile.bats
#
# Run tests with Bats: Bash Automated Testing System.
#
# https://github.com/sstephenson/bats
###############################################################################

load test_helper

setup() {
  cd "${BATS_TEST_DIRNAME}/.."
}

@test "Running \`make\` with no arguments prints help." {
  run make
  [[ "${status}" -eq 0 ]]
  _compare "${lines[0]}" "Usage:"
  [[ "${lines[0]}" == "Usage:" ]]
}

@test "Running \`make help\` prints help." {
  run make help
  [[ "${status}" -eq 0 ]]
  _compare "${lines[0]}" "Usage:"
  [[ "${lines[0]}" == "Usage:" ]]
}

@test "Running \`make example\` prints 'Hello!'" {
  run make example
  [[ "${status}" -eq 0 ]]
  _compare "${lines[0]}" "Hello!"
  [[ "${lines[0]}" == "Hello!" ]]
}

@test "Running \`make list\` prints list of targets." {
  run make list
  [[ "${status}" -eq 0 ]]
  _compare "${lines[0]}" "example"
  [[ "${lines[0]}" == "example" ]]
  [[ "${lines[1]}" == "help" ]]
  [[ "${lines[2]}" == "list" ]]
}
