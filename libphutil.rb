require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libphutil < Formula
  homepage 'http://phabricator.org/'
  url 'https://github.com/facebook/libphutil/tarball/master'
  version '0.1'

  keg_only 'Only used as a library for arcanist'

  head 'https://github.com/facebook/libphutil.git'

  def install
    prefix.install Dir['*']
  end

  def test
    system "true"
  end
end
