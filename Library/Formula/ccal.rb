require 'formula'

class Ccal < Formula
  url 'http://ccal.chinesebay.com/ccal/ccal-2.5.3.tar.gz'
  bottle do
    cellar :any
    sha1 "87c4287a5cac61f575195b93dc39ff762e89136a" => :mavericks
    sha1 "fd470bdbb8a8ee36eb11aa55f856300245bcf5a7" => :mountain_lion
    sha1 "95f7b62a877db2594b0c35cff7d616762645ab47" => :lion
  end

  homepage 'http://ccal.chinesebay.com/ccal'
  sha1 'b44d73804ef3ba9129ae196887509f99b508401c'

  def install
    system "make", "-e", "BINDIR=#{bin}", "install"
    system "make", "-e", "MANDIR=#{man}", "install-man"
  end

  test do
    output = `#{bin}/ccal 2 2014`
    assert output.include?("Year JiaWu, Month 1X")
    assert_equal 0, $?.exitstatus
  end
end
