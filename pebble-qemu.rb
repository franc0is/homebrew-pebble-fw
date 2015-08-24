class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"
  url "https://github.com/pebble/qemu.git"
  version "2.1.1"

  depends_on "pkg-config" => :build
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

    system "make", "install"
  end
end
