require 'formula'

class Bagit < Formula
  homepage 'https://github.com/LibraryOfCongress/bagit-java'
  url 'https://github.com/LibraryOfCongress/bagit-java/releases/download/bagit-4.9.0/bagit-4.9.0-bin.zip'
  sha1 '6ca4c2a202ce6c975b130a180cd3bd2dcbe5a756'

  bottle do
    cellar :any
    sha1 "6f5371126e55ec04115ed9ab349371d09a9b111e" => :mavericks
    sha1 "b295a6778369bd54f8af97c6c69a8c6414e2de82" => :mountain_lion
    sha1 "5a692d5f03899001fa252a4d1f293330ec6b233a" => :lion
  end

  def install
    # put logs in var, not in the Cellar
    (var/'log/bagit').mkpath
    inreplace "conf/log4j.properties", "${app.home}/logs", "#{var}/log/bagit"

    libexec.install Dir['*']

    bin.install_symlink libexec/"bin/bag"
  end

  test do
    system bin/'bag'
  end
end
