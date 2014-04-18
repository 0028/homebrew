require 'formula'

class Geogit < Formula
  homepage 'http://www.geogit.org'
  url 'https://downloads.sourceforge.net/project/geogit/geogit-0.7.1/geogit-cli-app-0.7.1.zip'
  sha1 'c28b3c353db98c7d08847ad4e87ecebcf98e37b5'

  bottle do
    cellar :any
    sha1 "fca6d9a114a4f2d35a593585307d66e96059a561" => :mavericks
    sha1 "596a3475213bf9241ad14ce6944cc597229748e6" => :mountain_lion
    sha1 "9324021014e8ac8b68f36ebc0da4a3c1eddc33b2" => :lion
  end

  def install
    bin.install "bin/geogit", "bin/geogit-console"
    prefix.install "repo"
  end
end
