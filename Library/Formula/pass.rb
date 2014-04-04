require 'formula'

class Pass < Formula
  homepage 'http://zx2c4.com/projects/password-store'
  url 'http://git.zx2c4.com/password-store/snapshot/password-store-1.4.2.tar.xz'
  sha256 'a10a8016a3d6bb32891a9a4086ac0a049587db1a55c1ac3b431c66189bc1a302'

  bottle do
    cellar :any
    sha1 "38ecae8e327e7cd89b9695537e7217bf3def0ef7" => :mavericks
    sha1 "d3fa71da6a0b4451872d9ee03aee7014bd177b2f" => :mountain_lion
    sha1 "61710a8464fd7d9a7e53b288af6581af30e26bd5" => :lion
  end

  head 'http://git.zx2c4.com/password-store', :using => :git

  depends_on 'pwgen'
  depends_on 'tree'
  depends_on 'gnu-getopt'
  depends_on 'gnupg2'

  def install
    system "make DESTDIR=#{prefix} PREFIX=/ install"
    if build.head?
      zsh_completion.install "src/completion/pass.zsh-completion" => "_pass"
    else
      zsh_completion.install "contrib/pass.zsh-completion" => "_pass"
    end
  end

  test do
    system "#{bin}/pass", "--version"
  end
end
