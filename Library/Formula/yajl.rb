require 'formula'

class Yajl < Formula
  homepage 'http://lloyd.github.io/yajl/'
  url 'https://github.com/lloyd/yajl/archive/2.0.4.tar.gz'
  sha256 '0e78f516dc53ecce7dc073f9a9bb0343186b58ef29dcd1dad74e5e853b216dd5'

  bottle do
    revision 1
    sha1 "d5d487907385d65dee008098c349568da10dd1e5" => :mavericks
    sha1 "54eba6f5750ed8f5f50afbfa8050c57ba1cc5364" => :mountain_lion
    sha1 "009a89024a9a4b2a13bb9e6b609e7fbcbb933116" => :lion
  end

  # Configure uses cmake internally
  depends_on 'cmake' => :build

  def install
    ENV.deparallelize

    system "./configure", "--prefix=#{prefix}"
    system "make install"
    (include/'yajl').install Dir['src/api/*.h']
  end

  test do
    output = `echo "[0,1,2,3]" | '#{bin}/json_verify'`
    assert $?.success?
    assert_match /valid/i, output.strip
  end
end
