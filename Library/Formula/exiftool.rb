require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.44.tar.gz'
  sha1 '4112d1d6a2a02f1669a0882b6a00f8bb9185f5f5'

  bottle do
    cellar :any
    sha1 '74d5a2d0be0def586a670337921d05591445404f' => :mavericks
    sha1 '45a34e26bd8a8514c53ee013f9252556344a9a2a' => :mountain_lion
    sha1 '8c4251c6adc47ea60374c2553fcdc5f77f727fe2' => :lion
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
