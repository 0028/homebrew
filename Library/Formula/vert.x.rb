require 'formula'

class VertX < Formula
  homepage 'http://vertx.io/'
  url 'http://dl.bintray.com/vertx/downloads/vert.x-2.1RC3.tar.gz'
  sha1 'a45e0d468262c7bc9308771e46bd1f318f2dabb6'

  bottle do
    cellar :any
    sha1 "e1b145e3f6946d0f8352bffb78e439a6dafb3d72" => :mavericks
    sha1 "2672e515be84bda8ca3f080f0dbfae02c0f5c240" => :mountain_lion
    sha1 "da77302bb19ccc2833545ee502f0f3feb47a7bbe" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin client conf lib]
    doc.install %w[api-docs]
    bin.install_symlink "#{libexec}/bin/vertx"
  end
end
