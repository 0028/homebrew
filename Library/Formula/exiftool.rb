require 'formula'

class Exiftool < Formula
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.57.tar.gz'
  sha1 '830811897b24e0735abfe4cbbb12251ae28b2efd'

  bottle do
    cellar :any
    sha1 "fe937fc50e9c8671c8f25e873020417028c40e22" => :mavericks
    sha1 "838bd411411acdfb31a623c6dec8c40b63d40794" => :mountain_lion
    sha1 "5d5de07e1b533cd73646f272fdb503065c99d62b" => :lion
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

  test do
    system "#{libexec}/exiftool"
  end
end
