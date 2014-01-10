require 'formula'

class OsspUuid < Formula
  homepage 'http://www.ossp.org/pkg/lib/uuid/'
  url 'http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz'
  mirror 'ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz'
  sha1 '3e22126f0842073f4ea6a50b1f59dcb9d094719f'

  bottle do
    cellar :any
    revision 2
    sha1 'baa80572486366900bf7e7742b0f009d62d1789b' => :mavericks
    sha1 '4693e5ad7042eead8c253599abd8f54bcffb0230' => :mountain_lion
    sha1 'e2a8f1510e7998c206cce761d420d1d7e15cd724' => :lion
  end

  option :universal
  option "32-bit"

  # see https://github.com/Homebrew/homebrew/issues/16077
  keg_only "OS X provides a uuid.h which conflicts with ossp-uuid's header."

  def install
    if build.universal?
      ENV.universal_binary
    elsif build.build_32_bit?
      ENV.append 'CFLAGS', '-arch i386'
      ENV.append 'LDFLAGS', '-arch i386'
    end

    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--without-perl",
                          "--without-php",
                          "--without-pgsql"
    system "make"
    system "make install"
  end
end
