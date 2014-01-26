require 'formula'

class X3270 < Formula
  homepage 'http://x3270.bgp.nu/'
  url 'http://downloads.sourceforge.net/project/x3270/x3270/3.3.14ga6/suite3270-3.3.14ga6-src.tgz'
  sha1 '4788ea7396d4aff04685382e82c440689e8014aa'

  bottle do
    sha1 "6b4c42d66e41afed16601e643d5ace7f5e6de93a" => :mavericks
    sha1 "59e18ca8b602f63a23eaf36546df126ab07a4358" => :mountain_lion
    sha1 "8da07a1348a7724eca21823fa22b0a0d7f6e807a" => :lion
  end

  depends_on :x11

  option 'with-c3270', 'Include c3270 (curses-based version)'
  option 'with-s3270', 'Include s3270 (displayless version)'
  option 'with-tcl3270', 'Include tcl3270 (integrated with Tcl)'
  option 'with-pr3287', 'Include pr3287 (printer emulation)'

  def make_directory(directory)
    cd directory do
      system "./configure", "--prefix=#{prefix}"
      system "make"
      system "make install"
      system "make install.man"
    end
  end

  def install
    make_directory 'x3270-3.3'
    make_directory 'c3270-3.3' if build.include? "with-c3270"
    make_directory 'pr3287-3.3' if build.include? "with-pr3287"
    make_directory 's3270-3.3' if build.include? "with-s3270"
    make_directory 'tcl3270-3.3' if build.include? "with-tcl3270"
  end
end
