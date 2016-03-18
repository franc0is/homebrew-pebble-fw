class ArmNoneEabiGcc < Formula
  homepage "https://launchpad.net/gcc-arm-embedded"
  version "20140805"
  url "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2"
  sha256 "a6353db31face60c2091c2c84c902fc4d566decd1aa04884cd822c383d13c9fa"

  bottle do
    revision 1
    sha256 "96430573d79b714c67092efdc0793a9d731eedba2f86481bb3df540c306be688" => :el_capitan
  end

  resource "sources" do
    url "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-src.tar.bz2"
    sha256 "596c577b44e29d5b4b613493e8132b85159bfee14a5141db09d20bf3739e27e9"
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
