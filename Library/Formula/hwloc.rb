require 'formula'

class Hwloc < Formula
  homepage 'http://www.open-mpi.org/projects/hwloc/'
  url 'http://www.open-mpi.org/software/hwloc/v1.8/downloads/hwloc-1.8.tar.gz'
  sha1 '6c92ad6fc795ef380637b38835f20a01192d6ad5'

  bottle do
    sha1 '2c5b645ac05467db021d1ecfcc4cd1695c3b63d4' => :mavericks
    sha1 '37914f16c5e96d0847808339888f5c3a11f0cb47' => :mountain_lion
    sha1 'a9ec80818a38fb0011b55e5feedf57fba1779887' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'cairo' => :optional

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
