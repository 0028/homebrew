require 'formula'

class Jpegoptim < Formula
  homepage 'https://github.com/tjko/jpegoptim'
  url 'https://github.com/tjko/jpegoptim/archive/RELEASE.1.3.0.tar.gz'
  sha1 '02bf879a6c2a960e51a9e2b45c6eb342b2363783'
  head 'https://github.com/tjko/jpegoptim.git'

  bottle do
    cellar :any
    sha1 "4b812e3a0482339456c9a6dc005ef2f8e9732138" => :mavericks
    sha1 "0de961749c0c4a2a98d9f4db17ac7160a902946d" => :mountain_lion
    sha1 "06985366c8f85d1e72285c042d4569be7f69c2b4" => :lion
  end

  depends_on 'jpeg'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    ENV.j1 # Install is not parallel-safe
    system "make install"
  end
end
