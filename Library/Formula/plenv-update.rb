require 'formula'

class PlenvUpdate < Formula
  homepage 'https://github.com/Tacahilo/plenv-update'
  url 'https://github.com/Tacahilo/plenv-update/archive/v0.1.2.zip'
  sha1 '9e8385f9adef71b0fc62048ecc3abda74e494865'

  head 'git@github.com:Tacahilo/plenv-update.git'

  bottle do
    cellar :any
    sha1 '5ad744a3b00df7e9a457671d39d1b81f852ff971' => :mavericks
    sha1 '4372f336f80cadc579d096622a09f4ea4b660c47' => :mountain_lion
    sha1 '73abf607009d27935574a1254bc73385e7870e4c' => :lion
  end

  depends_on 'plenv'

  def install
    prefix.install Dir['*']
  end
end
