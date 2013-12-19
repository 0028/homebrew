require 'formula'

class VertX < Formula
  homepage 'http://vertx.io/'
  url 'http://dl.bintray.com/vertx/downloads/vert.x-2.0.2-final.tar.gz'
  sha1 'fc8cce1d3fca9eeac90e15e6338f83c01ca1d44a'

  bottle do
    cellar :any
    sha1 'bcf208982d225b6938c0b0eab7f2ea9353b2cf77' => :mavericks
    sha1 'ee90a0d31d8be101b74e6b11c8c465074d28059a' => :mountain_lion
    sha1 '997e0c052faf1cb1373d511f6c1d3c8b0fbf9795' => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin client conf lib]
    doc.install %w[api-docs]
    bin.install_symlink "#{libexec}/bin/vertx"
  end
end
