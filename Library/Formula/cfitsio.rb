require 'formula'

class Cfitsio < Formula
  homepage 'http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html'
  url 'http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3360.tar.gz'
  bottle do
    cellar :any
    sha1 '656982ed7097b3d52ab3d4da9a9a67b4f917a461' => :mavericks
    sha1 '6f4e84dcbf492296ef150b28ad71d3821debb4f1' => :mountain_lion
    sha1 'dcfb1edac8d85f4d3cdd8d6767a1ec570b46e9ef' => :lion
  end

  mirror 'https://downloads.sourceforge.net/project/machomebrew/mirror/cfitsio-3.360.tar.gz'
  sha1 '946dce52528b0e4eb865db75c4e103cdd8cf51f8'
  version '3.360'

  option 'with-examples', "Compile and install example programs"

  resource 'examples' do
    url 'http://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples/cexamples.zip'
    version '2012.09.24'
    sha1 '668ffa9a65a66c9f1d7f4241867e1e8adf653231'
  end if build.with? 'examples'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make shared"
    system "make install"

    if build.with? 'examples'
      system "make fpack funpack"
      bin.install 'fpack', 'funpack'

      resource('examples').stage do
        # compressed_fits.c does not work (obsolete function call)
        Dir['*.c'].reject{|f| f == 'compress_fits.c'}.each do |f|
          system ENV.cc, f, "-I#{include}", "-L#{lib}", "-lcfitsio", "-lm", "-o", "#{bin}/#{f.sub('.c', '')}"
        end
      end
    end
  end
end
