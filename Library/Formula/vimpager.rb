require 'formula'

class Vimpager < Formula
  homepage 'https://github.com/rkitover/vimpager'
  url 'https://github.com/rkitover/vimpager/archive/1.8.8.tar.gz'
  sha1 '69f32e77a64dcd8abea873a7eb05d80b9b6f76b2'
  head 'https://github.com/rkitover/vimpager.git'

  bottle do
    cellar :any
    sha1 "b747c802320cb2a5591981a258f1b6f9e2792f4a" => :mavericks
    sha1 "4154724ee6907dcc3846201a88ecbb959a4b0379" => :mountain_lion
    sha1 "ca94ce3e4cb0a02eecbcd60f03eeea73fd12ea98" => :lion
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
