require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.47.tar.gz'
  sha1 '670ce0784e9eba7686f299dffb9088b32eb42a85'

  bottle do
    cellar :any
    sha1 'a96105122040c112fe12a255ae28ac648a22c276' => :mavericks
    sha1 '9e0e53de0c8732788bbc91c81e937f45c451b709' => :mountain_lion
    sha1 '87d3879bdd6ac8adc74f901c9c7b74e251c50cff' => :lion
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
