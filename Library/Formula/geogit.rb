require 'formula'

class Geogit < Formula
  homepage 'http://www.geogit.org'
  url 'https://downloads.sourceforge.net/project/geogit/geogit-0.7.0/geogit-cli-app-0.7.0.zip'
  sha1 'b98db1e1a4d7e6e1abf2cf8d96ed647d213c1c92'

  bottle do
    cellar :any
    sha1 "a8f7776aee059e2e685ae48ff3a43185c04f4383" => :mavericks
    sha1 "45b226e50201a58dfaf72626a5cc2ed7121e23aa" => :mountain_lion
    sha1 "e0af7a03e37f7c6f73e559d2d5710199049c1416" => :lion
  end

  def install
    bin.install "bin/geogit", "bin/geogit-console"
    prefix.install "repo"
  end
end
