require 'formula'

class Direnv < Formula
  homepage 'http://www.direnv.net'
  url 'https://github.com/zimbatm/direnv/archive/v2.2.0.tar.gz'
  sha1 '61d0264cf17e5141f203d564f6894823e950fafd'

  head 'https://github.com/zimbatm/direnv.git'

  bottle do
    sha1 '93a33c275eae0bb530c19a16f5005c8bdd2cb9bb' => :mavericks
    sha1 '3e937d97fe66df8b5c8a33bbd517b925f1c6f3c0' => :mountain_lion
    sha1 'c680cf8fc77aacf098fd876cbe7fd4c766db9995' => :lion
  end

  depends_on "go" => :build

  def install
    system "make", "install", "DESTDIR=#{prefix}"
  end

  def caveats; <<-EOS.undent
    At the END of your ~/.bashrc or ~/.zshrc, add the following line:
      eval "$(direnv hook $0)"

    See the wiki for docs and examples:
      https://github.com/zimbatm/direnv/wiki/
    EOS
  end
end
