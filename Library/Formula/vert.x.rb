require 'formula'

class VertX < Formula
  homepage 'http://vertx.io/'
  url 'http://dl.bintray.com/vertx/downloads/vert.x-2.1M5.tar.gz'
  sha1 '29695bdce55908823423596aeca344bc142c31cb'
  version '2.1M5'

  bottle do
    cellar :any
    sha1 "d9054ab94634e147a32c7919a0806a4f3a60dc99" => :mavericks
    sha1 "fbc5212a1ae7ed93ff29713dde84df29f5e32403" => :mountain_lion
    sha1 "0b740c38c48c83f5f8dfdda7e5ae1e33d4f2259a" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin client conf lib]
    doc.install %w[api-docs]
    bin.install_symlink "#{libexec}/bin/vertx"
  end
end
