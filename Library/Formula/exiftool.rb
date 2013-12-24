require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.45.tar.gz'
  sha1 'f10613164740b0cda7e342d1a9cbaf05079395df'

  bottle do
    cellar :any
    sha1 '136d153a7cea7d4d27d8a2325fcd4b3645d30473' => :mavericks
    sha1 '3a5a7263e632c8f9593e3e28a7e04408a329ebdc' => :mountain_lion
    sha1 '56cdb85d8aa65ca55efef2e0892befddc93ead65' => :lion
  end

  def install
    system "perl", "Makefile.PL"
    system "make", "test"

    # Install privately to the Cellar
    libexec.install "exiftool", "lib"

    # Link the executable script into "bin"
    (bin + 'exiftool').write <<-EOBIN
#!/bin/bash

which_exiftool=`which $0`
dirname_exiftool=$(dirname $which_exiftool)
readlink_exiftool=$(readlink $which_exiftool)
dirname_unlinked_exiftool=$(dirname $dirname_exiftool/$readlink_exiftool)
$dirname_unlinked_exiftool/../libexec/exiftool "$@"
EOBIN
  end

  def test
    system "#{libexec}/exiftool"
  end
end
