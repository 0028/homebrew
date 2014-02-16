require 'formula'

class Hwloc < Formula
  homepage 'http://www.open-mpi.org/projects/hwloc/'
  url 'http://www.open-mpi.org/software/hwloc/v1.8/downloads/hwloc-1.8.1.tar.gz'
  sha1 '4ed7c5d873fd16974b756efa5727c5b2caaa0118'

  bottle do
    sha1 "885b645c48b90fe1e675bf2a83421c4b163ee5c9" => :mavericks
    sha1 "b22e89a4fbdb1f483e77b49ded9bcf5b705e75e2" => :mountain_lion
    sha1 "98ac74c5913433e88a665a4c838effbb7f6561e3" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'cairo' => :optional

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
