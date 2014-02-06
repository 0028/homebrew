require 'formula'

class Cfitsio < Formula
  homepage 'http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html'
  url 'http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3360.tar.gz'
  bottle do
    cellar :any
    sha1 "843ddcdb5cd41e0b50d5bfdb23d7dca136ce9ffe" => :mavericks
    sha1 "4966c90fed5c9f00d793c40899ab7530e95c9b9e" => :mountain_lion
    sha1 "0300a3bc392df3cf57090f7369192a79b56a7d15" => :lion
  end

  mirror 'https://downloads.sourceforge.net/project/machomebrew/mirror/cfitsio-3.360.tar.gz'
  sha1 '946dce52528b0e4eb865db75c4e103cdd8cf51f8'
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
