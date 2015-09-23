class PebbleOpenocd < Formula
  homepage "https://github.com/pebble/openocd"
  url "https://github.com/pebble/openocd.git", :branch => "pebble_fork"
  version "0.9"

  bottle do
    root_url "http://pebble-homebrew.s3.amazonaws.com"
    sha256 "bb3507813cce8e307b1823f32c6672a9b30190f55220cb8a9e3397d024b754ed" => :yosemite
  end

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
    system "make", "install"
  end
end
