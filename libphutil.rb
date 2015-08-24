class Libphutil < Formula
  homepage 'http://phabricator.org/'
  url 'https://github.com/facebook/libphutil/archive/master.tar.gz'
  version '0.1'

  keg_only 'Only used as a library for arcanist'

  head 'https://github.com/facebook/libphutil.git'

  def install
    prefix.install Dir['*']
  end

  test do
    system "true"
  end
end
