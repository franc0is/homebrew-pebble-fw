class PebbleOpenocd < Formula
  homepage "https://github.com/pebble/openocd"
  url "https://github.com/pebble/openocd.git", :branch => "pebble_fork"
  version "0.9"

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
