require 'formula'

class Cfitsio < Formula
  homepage 'http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html'
  url 'http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3360.tar.gz'
  bottle do
    cellar :any
    sha1 "e3cb3c6cf7fee5f4a5a4e5632081d420037a0940" => :mavericks
    sha1 "12afafd4938a4f1f91c8b6b2b1aed74910c10943" => :mountain_lion
    sha1 "8c82ed914d6ad008f9a068dc3c04acf094de8797" => :lion
  end

  mirror 'https://downloads.sourceforge.net/project/machomebrew/mirror/cfitsio-3.360.tar.gz'
  sha1 '0d3099721a6bf1e763f158c447a74c5e8192412d'
  version '3.360'

  option 'with-examples', "Compile and install example programs"

  resource 'examples' do
    url 'http://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples/cexamples.zip'
    version '2014.01.23'
    sha1 '39a66bb611bf611e7c88f0a410234c0d4955529c'
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
