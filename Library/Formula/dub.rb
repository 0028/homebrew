require 'formula'

class Dub < Formula
  homepage 'http://registry.vibed.org/'
  url  'https://github.com/rejectedsoftware/dub/archive/v0.9.21.tar.gz'
  sha1 '7752e14f3f5add50b1c7d9138739d72b276e6abe'

  head 'https://github.com/rejectedsoftware/dub.git'

  bottle do
    sha1 "b3fe8357d14d28d5bccf28e13721b8b1955fd80e" => :mavericks
    sha1 "523a8774055572b538b5b9bb66a12b631ae1baf6" => :mountain_lion
    sha1 "5bf2eabebf6132d070834abdce8944ad80fbde24" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'dmd'  => :build

  def install
    system "./build.sh"
    bin.install 'bin/dub'
  end

  test do
    system "#{bin}/dub; true"
  end
end
