require 'formula'

class Freetype < Formula
  homepage 'http://www.freetype.org'
  url 'http://download.savannah.gnu.org/releases/freetype/freetype-2.4.11.tar.bz2'
  sha1 'b15e5a0b30c1e854484b410340f6429ad1253c74'

  keg_only :provided_pre_mountain_lion

  option :universal

  bottle do
    # Included with X11 so no bottle needed before Mountain Lion.
    sha1 '7dc4747810e51beb99fd36c8f5baade6e65d19b7' => :mountain_lion
  end

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/freetype-config", '--cflags', '--libs', '--ftversion',
      '--exec-prefix', '--prefix'
  end
end
