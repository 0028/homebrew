require 'formula'

class Tmux < Formula
  homepage 'http://tmux.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9.tar.gz'
  sha1 '43197e69716a0430a9e856c13df8ceae31783078'

  bottle do
    cellar :any
    sha1 "8d7515585f2e20dc477659f83d2cb959cb98ff57" => :mavericks
    sha1 "2e97e0b51f5a67ea26f1206eb82fecb88f03e736" => :mountain_lion
    sha1 "e5c09379534e61df5f83fea099015357d6d97956" => :lion
  end

  head do
    url 'git://git.code.sf.net/p/tmux/tmux-code'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'libevent'

  def install
    system "sh", "autogen.sh" if build.head?

    ENV.append "LDFLAGS", '-lresolv'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make install"

    bash_completion.install "examples/bash_completion_tmux.sh" => 'tmux'
    (share/'tmux').install "examples"
  end

  def caveats; <<-EOS.undent
    Example configurations have been installed to:
      #{share}/tmux/examples
    EOS
  end

  def test
    system "#{bin}/tmux", "-V"
  end
end
