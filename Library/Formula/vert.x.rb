require 'formula'

class VertX < Formula
  homepage 'http://vertx.io/'
  url 'http://dl.bintray.com/vertx/downloads/vert.x-2.1M3.tar.gz'
  sha1 'f880cb78b116f27c303021d2eaa8e6fd00c2850b'
  version '2.1M3'

  bottle do
    cellar :any
    sha1 "eccaf6cbdb6fae1c61c85e6be60f96edfd458e21" => :mavericks
    sha1 "831cfe43e2dd9c0155622065c68f8a40eebac734" => :mountain_lion
    sha1 "749e72c2d84eef90652604ed470628d75e0767f9" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin client conf lib]
    doc.install %w[api-docs]
    bin.install_symlink "#{libexec}/bin/vertx"
  end
end
