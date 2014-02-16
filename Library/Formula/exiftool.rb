require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.51.tar.gz'
  sha1 'f79309276f1d41475a89fedf4b87d9029ffef934'

  bottle do
    cellar :any
    sha1 "3e006509ac506ebc21d6dedd3f03b4500044f0c6" => :mavericks
    sha1 "190356ff310996be245609965db85821693197f8" => :mountain_lion
    sha1 "91a68e9d0ce51ad87e3ae8be7cad2c7bef5c4655" => :lion
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
