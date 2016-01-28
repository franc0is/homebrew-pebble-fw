class ArmNoneEabiGcc < Formula
  homepage "https://launchpad.net/gcc-arm-embedded"
  version "20140609"
  url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-mac.tar.bz2"
  sha256 "dbfa2170e67f30aad349581b7db8ce61f257c3a51e32943ec12a384b1dcd7cf9"

  bottle do
    root_url "http://pebble-homebrew.s3.amazonaws.com"
    sha256 "02ed7a6e8aa02e5794c8e822ac0bc64bd7497a78e4237ba5db3f7102e376b967" => :yosemite
  end

  resource "sources" do
    url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-src.tar.bz2"
    sha256 "5c0843c5e4897ab3379523c2094208c0a7192a74d5bf25a9e545295696563e5a"
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
