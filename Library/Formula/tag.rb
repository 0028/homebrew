require 'formula'

class Tag < Formula
  homepage 'https://github.com/jdberry/tag/'
  url 'https://github.com/jdberry/tag/archive/v0.7.5.tar.gz'
  sha1 'e1075a1068f6a4cb377144e162ee47c063a4a0d6'
  head 'https://github.com/jdberry/tag.git'

  bottle do
    cellar :any
    sha1 "b1e268d6f2f599c7cb98fbc160eb7543dbcf1e94" => :mavericks
  end

  depends_on :macos => :mavericks

  def install
    system 'make'
    bin.install 'bin/tag'
  end

  test do
    test_tag = 'test_tag'
    test_file = Pathname.pwd+'test_file'
    touch test_file
    system "#{bin}/tag", '--add', test_tag, test_file
    assert `#{bin}/tag --list --no-name #{test_file}`.chomp == test_tag
  end
end
