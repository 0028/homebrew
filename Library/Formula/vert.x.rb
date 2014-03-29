require 'formula'

class VertX < Formula
  homepage 'http://vertx.io/'
  url 'http://dl.bintray.com/vertx/downloads/vert.x-2.1RC2.tar.gz'
  sha1 'c8f8f2e5c7fdcffd460a7c0be980cdcfa9867f33'

  bottle do
    cellar :any
    sha1 "9d16709eb96c8e5aa6fa827636a1647391b5fc34" => :mavericks
    sha1 "af0d8efc7388a8c545e83fcb8312f7f787dd6409" => :mountain_lion
    sha1 "19ede85970fa2f0df501a9b5acffc6277667cff0" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin client conf lib]
    doc.install %w[api-docs]
    bin.install_symlink "#{libexec}/bin/vertx"
  end
end
