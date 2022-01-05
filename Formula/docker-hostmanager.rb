# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DockerHostmanager < Formula
  desc "Update automatically your `/etc/hosts` to access running containers."
  homepage ""
  url "https://github.com/ttyz/docker-hostmanager/releases/download/v0.5.0/docker-hostmanager.phar"
  sha256 "ca5691a82ed660f7740ba0ac0e29df986f227dd84aaa1cb581da0c8ec5bb1926"
  license ""

  depends_on "php"
  depends_on "chipmk/tap/docker-mac-net-connect" => :recommended

  def install
    bin.install "docker-hostmanager.phar"
  end

  service do
    keep_alive true
    run [ HOMEBREW_PREFIX/"bin/php", bin/"docker-hostmanager.phar" ]
    log_path var/"log/docker-hostmanager/stdout.log"
    error_log_path var/"log/docker-hostmanager/stderr.log"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test docker-hostmanager`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
