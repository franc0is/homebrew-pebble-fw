# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class PebbleOpenocd < Formula
  homepage ""
  url "https://github.com/pebble/openocd.git", :branch => "pebble_fork"
  version "0.9"
  sha256 ""

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "texinfo" => :build

  depends_on 'pkg-config' => :build
  depends_on 'libusb' => :recommended
  # some drivers are still not converted to libusb-1.0
  depends_on 'libusb-compat' if build.with? 'libusb'
  depends_on 'libftdi' => :recommended
  depends_on 'hidapi' => :recommended

  def install
    system "./bootstrap"
    system "./configure", "--disable-werror",
                          "--enable-maintainer-mode",
                          "--enable-ftdi",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end
end
