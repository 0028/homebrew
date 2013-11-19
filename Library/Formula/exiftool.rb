require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.41.tar.gz'
  sha1 '39f5cd51eafa1b1881cc0193a38bb31dda132b59'

  bottle do
    cellar :any
    sha1 '21ecc4ad8f8fd720fcca8e04a9feff7f4fc5f333' => :mavericks
    sha1 'c3cf218aa405300b07a4181a3e2fe2c6846f1df3' => :mountain_lion
    sha1 '3a6a7d72250e70ef2e05fd9357099573eab65e98' => :lion
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
