class ArmNoneEabiGcc < Formula
  homepage "https://launchpad.net/gcc-arm-embedded"
  version "20140609"
  url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q2-update/+download/gcc-arm-none-eabi-4_8-2014q2-20140609-mac.tar.bz2"
  sha256 "dbfa2170e67f30aad349581b7db8ce61f257c3a51e32943ec12a384b1dcd7cf9"

  resource "sources" do
    url "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q2-update/+download/gcc-arm-none-eabi-4_8-2014q2-20140609-src.tar.bz2"
    sha256 "5c0843c5e4897ab3379523c2094208c0a7192a74d5bf25a9e545295696563e5a"
  end

  def install
    cp_r %w(arm-none-eabi, bin, lib, share), "#{prefix}/", :verbose => true
    resource('sources').stage {
      system 'tar', '-xf', 'src/gdb.tar.bz2'
      Dir.chdir "gdb"
      system './configure', "--prefix=#{prefix}", '--target=arm-none-eabi', "--with-python=yes"
      system 'make'
      system 'make install'
    }
  end
end
