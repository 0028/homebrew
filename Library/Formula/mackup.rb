require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.5.8.tar.gz'
  sha1 'adab98fe9350ce45d4502a44b891dde64375d604'

  bottle do
    cellar :any
    sha1 "4455bd068a9a5fd0ab830a4045acd30e715a9234" => :mavericks
    sha1 "d1fedfeda97bc648a78784129896d1cbe2aa2c37" => :mountain_lion
    sha1 "dcf6ec28c11e1eddc1e0fe510c5f2b17b4a6c28d" => :lion
  end

  def install
    bin.install "mackup.py" => "mackup"
    (share/'mackup').install ".mackup.cfg" => "mackup.cfg.example"
  end
end
