require 'formula'

class Wemux < Formula
  homepage 'https://github.com/zolrath/wemux'
  url 'https://github.com/zolrath/wemux/archive/v3.2.0.tar.gz'
  sha1 '099e6afbd5313aadd9a4dae7fc416f3846888624'

  head 'https://github.com/zolrath/wemux.git'

  bottle do
    cellar :any
    revision 1
    sha1 "fd6b1faa6d452eaf4b6776635627b93acdafd976" => :mavericks
    sha1 "e6c77c3d4cce9ced4216931aa399e256d49f198f" => :mountain_lion
    sha1 "2154a78d97ef6a81b995a52900bd79d0c4edaa17" => :lion
  end

  depends_on 'tmux'

  def install
    inreplace 'wemux', '/usr/local/etc', etc
    bin.install 'wemux'
    man1.install 'man/wemux.1'

    inreplace 'wemux.conf.example', 'change_this', ENV['USER']
    etc.install 'wemux.conf.example' => 'wemux.conf'
  end

  def caveats; <<-EOS.undent
    Your current user account has been automatically added as a wemux host.

    To give a user the ability to host wemux sessions add them to the
    host_list array in:
      #{etc}/wemux.conf

    Either edit the file in your text editor of choice or run `wemux conf` to
    open the file in your $EDITOR.
    EOS
  end

  test do
    system "#{bin}/wemux", "help"
  end
end
