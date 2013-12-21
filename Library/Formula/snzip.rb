require 'formula'

class Snzip < Formula
  homepage 'https://github.com/kubo/snzip'
  url 'https://github.com/kubo/snzip/archive/1.0.1.tar.gz'
  sha1 '3aac364c0a508cdb06d771cede6c5758aeb89666'

  bottle do
    cellar :any
    sha1 'c1ba7a57da20d83861aef0857fc3e31f0cb63a96' => :mavericks
    sha1 'f76edb5c02a0a986a0369eadf4030604666092f9' => :mountain_lion
    sha1 '4bf3809d150372c0395dfe327a15f694c1be312e' => :lion
  end

  depends_on 'automake' => :build
  depends_on 'autoconf' => :build
  depends_on 'snappy'

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "snzip", "-h"
  end
end
