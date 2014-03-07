require 'formula'

class Virtuoso < Formula
  homepage 'http://virtuoso.openlinksw.com/wiki/main/'
  url "https://downloads.sourceforge.net/project/virtuoso/virtuoso/7.1.0/virtuoso-opensource-7.1.0.tar.gz"
  sha1 "255d275d810bdb7cfa55fef46517724823c4c561"

  bottle do
    sha1 "8303743836733e4fa961e6a3c8ad3100c7261679" => :mavericks
    sha1 "db4e1060378e4a82aee2f1185b1e5fe15a5170bd" => :mountain_lion
    sha1 "d0850303025530d5372d04bb4e6917bbfc9c1e13" => :lion
  end

  head do
    url 'https://github.com/openlink/virtuoso-opensource.git', :branch => 'stable/7'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  # If gawk isn't found, make fails deep into the process.
  depends_on 'gawk' => :build

  conflicts_with 'unixodbc', :because => 'Both install `isql` binaries.'

  skip_clean :la

  def install
    ENV.m64 if MacOS.prefer_64_bit?
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    NOTE: the Virtuoso server will start up several times on port 1111
    during the install process.
    EOS
  end
end
