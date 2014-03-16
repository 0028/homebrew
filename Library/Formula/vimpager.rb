require 'formula'

class Vimpager < Formula
  homepage 'https://github.com/rkitover/vimpager'
  url 'https://github.com/rkitover/vimpager/archive/1.8.7.tar.gz'
  sha1 '796bb69e30a0b87ee65bf29c5ae800a16033f85f'
  head 'https://github.com/rkitover/vimpager.git'

  bottle do
    cellar :any
    sha1 "75dcd00e5a872314fcd95d559b293f7f15daf4db" => :mavericks
    sha1 "edc3077e89b737167ba42f695307b9a3a2984bf6" => :mountain_lion
    sha1 "14c21df4485f454166bc651ada4f00d728fc770b" => :lion
  end

  def install
    inreplace 'vimpager.1', '~/bin/', ''

    bin.install 'vimcat'
    bin.install 'vimpager'
    man1.install gzip('vimpager.1')
  end

  def caveats; <<-EOS.undent
    To use vimpager as your default pager, add `export PAGER=vimpager` to your
    shell configuration.
    EOS
  end
end
