require 'formula'

class TmuxCssh < Formula
  homepage 'https://github.com/dennishafemann/tmux-cssh'
  url 'https://github.com/dennishafemann/tmux-cssh/archive/0.1.tar.gz'
  sha1 '477a9079775ce48afe0c90699fa69f368e69cdfd'

  bottle do
    cellar :any
    sha1 "1f5986417dad5da3cc78d34bfcd9b4e1a81cd498" => :mavericks
    sha1 "6fa2b2a5d6bfbe32ef19d52b03c28136b6ead05c" => :mountain_lion
    sha1 "3eeca798b0172cd100b5095fd1ade45ffe77c341" => :lion
  end

  depends_on 'tmux'

  def install
    bin.install 'tmux-cssh'
  end

  test do
    system "#{bin}/tmux-cssh", "--help"
  end

end
