require 'formula'

class Hoedown < Formula
  homepage 'https://github.com/hoedown/hoedown'
  url 'https://github.com/hoedown/hoedown/archive/2.0.0.tar.gz'
  sha1 '51cd3f80b4798fb305b66bbfce4cfa7da9f1b775'

  bottle do
    cellar :any
    sha1 '4332db5d98a8f8001e187fb1308ae0a031aff0e8' => :mavericks
    sha1 '35c74b5aa91966c9f3ee9c530842a982ed3d12ab' => :mountain_lion
    sha1 '426b3f0c583f2e7677bb76a7cd60db006125901c' => :lion
  end

  def install
    system 'make', 'hoedown'
    bin.install 'hoedown'
    prefix.install 'test'
  end

  test do
    system 'perl', "#{prefix}/test/MarkdownTest_1.0.3/MarkdownTest.pl", "--script=#{bin}/hoedown", "--testdir=#{prefix}/test/MarkdownTest_1.0.3/Tests", '--tidy'
  end
end
