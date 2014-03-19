require 'formula'

class Storm < Formula
  homepage 'https://github.com/nathanmarz/storm/wiki'
  url 'http://mirror.csclub.uwaterloo.ca/apache/incubator/storm/apache-storm-0.9.1-incubating/apache-storm-0.9.1-incubating.zip'
  sha1 '75f28e07fae2d21e427ba998b93069ef7dd3e184'

  bottle do
    cellar :any
    sha1 "bcb8fab3004378805f5f18c8ebf60a27ae11b0d2" => :mavericks
    sha1 "85b2516a276ce89666332dfca5e825e91388546e" => :mountain_lion
    sha1 "72632f879fa61a9db4c463c8133b0ed61b7bdff5" => :lion
  end

  def install
    libexec.install Dir['*']
    bin.install_symlink libexec/"bin/storm"
  end
end
