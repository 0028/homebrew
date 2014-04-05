require "formula"

class Tevent < Formula
  homepage "http://tevent.samba.org/"
  url "http://www.samba.org/ftp/tevent/tevent-0.9.21.tar.gz"
  sha1 "daa1a4f457773be2e0f645beede93db6943224a5"

  bottle do
    cellar :any
    sha1 "6255c03addc1bbfced4dbe9a02aaf6a57e4f237a" => :mavericks
    sha1 "efe332ac4a77fc84600cf9a84cb1cc6f7bb6b1fc" => :mountain_lion
    sha1 "ff525cabffd1c92f520efd7fba44cc59551a18ab" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "talloc" # ">= 2.1.0"
  conflicts_with "samba", :because => "both install `include/tevent.h`"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-rpath", "--without-gettext", "--bundled-libraries=!talloc"
    system "make install"
  end
end
