class ArmNoneEabiGcc < Formula
  homepage "https://launchpad.net/gcc-arm-embedded"
  version "20140805"
  url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-mac.tar.bz2"
  sha256 "6b30901738b09a8d22fdfff99e991217444b80ac492a6163af5c06a3baaa3487"

  bottle do
    revision 1
    sha256 "96430573d79b714c67092efdc0793a9d731eedba2f86481bb3df540c306be688" => :el_capitan
  end

  resource "sources" do
    url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-src.tar.bz2"
    sha256 "09519946642d5366ab739a89d3388b2ea333cd7dc50192bab3736a9593af83e6"
  end

  option "with-brewed-python", "Use the Homebrew version of Python"

  def install
    prefix.install 'arm-none-eabi', 'bin', 'lib', 'share'
    resource('sources').stage {
      system 'tar', '-xf', 'src/gdb.tar.bz2'
      Dir.chdir "gdb"
      args = [
        "--prefix=#{prefix}",
        "--target=arm-none-eabi"
      ]
      if build.with? 'brewed-python'
        args << "--with-python=#{HOMEBREW_PREFIX}"
      else
        args << "--with-python=yes"
      end
      system './configure', *args
      system 'make'
      system 'make install'
    }
  end
end
