# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!  
class PebbleQemu < Formula
  homepage ""
  url "https://github.com/pebble/qemu.git"
  version "head"
  sha256 ""

  depends_on "pkgconfig" => :build
  depends_on "glib" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "./configure", "--disable-werror",
                          "--enable-debug",
                          '--target-list=arm-softmmu',
                          "--extra-cflags=-DSTM32_UART_NO_BAUD_DELAY",
                          "--prefix=#{prefix}"

    system "make", "install" # if this fails, try separate make/make install steps
  end
end
