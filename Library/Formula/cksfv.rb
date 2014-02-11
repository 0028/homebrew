require 'formula'

class Cksfv < Formula
  homepage 'http://zakalwe.fi/~shd/foss/cksfv/'
  url 'http://zakalwe.fi/~shd/foss/cksfv/files/cksfv-1.3.14.tar.bz2'
  sha1 'f6da3a559b2862691a2be6d2be0aac66cd624885'

  bottle do
    cellar :any
    sha1 "45376cbf459fe95c43326d8613146939c5900fec" => :mavericks
    sha1 "8b7c682d5ed5fcbc9673aa060f4de3a3d86bf386" => :mountain_lion
    sha1 "9ef5d245866dbb08528d928df26e94a8bf54e595" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    path = testpath/"foo"
    path.write "abcd"

    lines = `#{bin}/cksfv #{path}`.split("\n")
    assert lines.include?("#{path} ED82CD11")
    assert_equal 0, $?.exitstatus
  end
end
