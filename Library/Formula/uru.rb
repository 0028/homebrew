require 'formula'

class Uru < Formula
  homepage 'https://bitbucket.org/jonforums/uru'
  url 'https://bitbucket.org/jonforums/uru/downloads/uru-0.6.4-darwin-x86.tar.gz'
  version '0.6.4'
  sha1 'fc99fc0867c1d236155c624b4d88636f4c1e6bbe'

  bottle do
    cellar :any
    sha1 'cf1062b2a6f25d75736b7083a17873747c32fd29' => :mavericks
    sha1 'd911481b7b8fdb3c1a48d7ea5ab3c72b777cf0e1' => :mountain_lion
    sha1 '945eda44c8a99eb5cc52d664d012e64ef17c4223' => :lion
  end

  def install
    bin.install Dir['*']
  end

  def caveats; <<-EOS.undent
    # append to ~/.profile on Ubuntu, or to ~/.zshrc on Zsh
    $ echo 'eval "$(uru_rt admin install)"' >> ~/.bash_profile

    # register a pre-existing "system" ruby already placed on PATH from bash/Zsh
    # startup configuration files
    $ uru_rt admin add system

    # restart shell
    $ exec $SHELL -l
    EOS
  end

  test do
    system "#{bin}/uru_rt"
  end
end
