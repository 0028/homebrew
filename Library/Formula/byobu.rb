require 'formula'

class Byobu < Formula
  homepage 'http://byobu.co'
  url 'https://launchpad.net/byobu/trunk/5.69/+download/byobu_5.69.orig.tar.gz'
  sha1 '28823d25563e4356ac7dde7726d7dc68fb01ead8'

  bottle do
    cellar :any
    sha1 'eccd1090a7f6f6cd0173643166bcfafa9cd93c5f' => :mavericks
    sha1 '157945687c93ade188f874942d72fc6185529eec' => :mountain_lion
    sha1 '3fba1bab03039f578baf802e5f2a3e3dbc3666dd' => :lion
  end

  depends_on 'coreutils'
  depends_on 'gnu-sed' # fails with BSD sed
  depends_on 'tmux'
  depends_on 'newt' => 'with-python'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Add the following to your shell configuration file:
      export BYOBU_PREFIX=$(brew --prefix)
    EOS
  end

  test do
    system "#{bin}/byobu -v"
  end
end
