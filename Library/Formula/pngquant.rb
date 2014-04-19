require 'formula'

class Pngquant < Formula
  homepage 'http://pngquant.org/'
  url 'https://github.com/pornel/pngquant/archive/2.2.0.tar.gz'
  sha1 'd7ed6f13fdbef52074cbaee5452a2e7e27573376'

  head 'https://github.com/pornel/pngquant.git'

  bottle do
    cellar :any
    sha1 "47bc1e5c4b73b02317d8e41f93efaeaf4cd77df8" => :mavericks
    sha1 "5dad5fb056755f90e6774c515f7194fba28db007" => :mountain_lion
    sha1 "26c8d324867373518dc48b2f93c75bf0b08b4b9d" => :lion
  end

  depends_on 'libpng'

  def install
    ENV.append_to_cflags "-DNDEBUG" # Turn off debug
    system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}"
    bin.install 'pngquant'
    man1.install 'pngquant.1'
  end

  test do
    system "#{bin}/pngquant", "--help"
  end
end
