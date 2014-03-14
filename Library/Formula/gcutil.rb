require 'formula'

class Gcutil < Formula
  homepage 'https://developers.google.com/compute/docs/gcutil/'
  url 'https://dl.google.com/dl/cloudsdk/release/artifacts/gcutil-1.14.2.zip'
  sha1 'c8263333f68a7bf3468a6ed7cfe56c2390227605'

  bottle do
    cellar :any
    sha1 "13e2cd928e49594c0464053ce097503e9d176bd0" => :mavericks
    sha1 "1782cecf158769351560222fb408a3ba3aa6f371" => :mountain_lion
    sha1 "4217668093914532d7a22eaa4d19ca7db6c38103" => :lion
  end

  def install
    libexec.install 'gcutil', 'lib'
    bin.install_symlink libexec/"gcutil"
  end

  test do
    system "#{bin}/gcutil", "version"
  end
end
