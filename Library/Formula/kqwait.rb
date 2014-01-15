require 'formula'

class Kqwait < Formula
  homepage 'https://github.com/sschober/kqwait'
  url 'https://github.com/sschober/kqwait.git', :revision => '7dbafc50c9b16eb4b63774411629b4f016fed871'
  version '1.0.3'
  sha1 '7b4e762de8867593b21b06908a6ee13dbc1c863a'

  head 'https://github.com/sschober/kqwait.git'

  bottle do
    cellar :any
    sha1 'fca3df9923cbb313d8083b20a76bb626dad6879d' => :mavericks
    sha1 'cce71dc57cf635508e1b35b6311bb2bb0fe36520' => :mountain_lion
    sha1 '429233e374d74900b02c056b5f73f20e306a8057' => :lion
  end

  def install
    system "make"
    bin.install "kqwait"
  end

  test do
    system "#{bin}/kqwait", "-v"
  end
end
