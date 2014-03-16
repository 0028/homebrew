require 'formula'

class Ffind < Formula
  homepage 'https://github.com/sjl/friendly-find'
  url 'https://github.com/sjl/friendly-find/archive/v0.3.2.tar.gz'
  sha1 'fe4d943642e5bf344e2095122bb49216bcc2e2bd'

  bottle do
    cellar :any
    sha1 "2449bf5a2458079b16b8048da095c7d5b4c61d21" => :mavericks
    sha1 "eae1585e8c2215791ec2efa6956e1b18cdd40b0c" => :mountain_lion
    sha1 "93fc5aeffa5330dd2729508d0a54151c31cf7da1" => :lion
  end

  conflicts_with 'sleuthkit',
    :because => "both install a 'ffind' executable."

  def install
    bin.install "ffind"
  end

  test do
    system "#{bin}/ffind"
  end
end
