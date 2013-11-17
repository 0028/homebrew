require 'formula'

class Dnsperf < Formula
  homepage 'http://nominum.com/support/measurement-tools/'
  url 'ftp://ftp.nominum.com/pub/nominum/dnsperf/2.0.0.0/dnsperf-src-2.0.0.0-1.tar.gz'
  sha1 'a0cf8f95de821a9ca1b7f8001e5ef7334e968540'

  bottle do
    cellar :any
    sha1 '8750e1d7c464e04c41030c05f8fef3f6a4a66d50' => :mavericks
    sha1 '8220386310029fa591894eb90142847ec496030a' => :mountain_lion
    sha1 '0a9ee356a94ef35fd630573cee97bca98080698a' => :lion
  end

  depends_on 'bind'
  depends_on 'libxml2'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/dnsperf -h"
    system "#{bin}/resperf -h"
  end
end
