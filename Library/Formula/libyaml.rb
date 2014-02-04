require 'formula'

class Libyaml < Formula
  homepage 'https://bitbucket.org/xi/libyaml'
  url 'https://bitbucket.org/xi/libyaml/get/0.1.4.tar.gz'
  sha1 'ec13162bff400b4c65f563e5ac226961c8a44446'

  bottle do
    cellar :any
    sha1 "2155c5a51fc3a150c2808faab36125e12095a1f2" => :mavericks
    sha1 "f65fec71c749b98785ebe1cad9a1e3c13c4a63d1" => :mountain_lion
    sha1 "45a8ea1a57025934864124261d604957275e863f" => :lion
  end

  option :universal

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    ENV.universal_binary if build.universal?

    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
