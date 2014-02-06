require 'formula'

class Direnv < Formula
  homepage 'http://www.direnv.net'
  url 'https://github.com/zimbatm/direnv/archive/v2.3.0.tar.gz'
  sha1 '761b1705cd9925d36534050c4a586bb5607eb87f'

  head 'https://github.com/zimbatm/direnv.git'

  bottle do
    sha1 "760e6ff9043373d42349ed8d561946571bc3e09d" => :mavericks
    sha1 "475bbe829c7212f33566fca57d9604a74644b2ca" => :mountain_lion
    sha1 "c3c4cd22dc108611339b6eff52158d7983d9b29a" => :lion
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
