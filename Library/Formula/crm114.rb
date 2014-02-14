require 'formula'

class Crm114 < Formula
  homepage 'http://crm114.sourceforge.net/'
  url 'http://crm114.sourceforge.net/tarballs/crm114-20100106-BlameMichelson.src.tar.gz'
  sha1 '621106ff14fa66a5a878a2c8fb0251ec483fc17b'

  bottle do
    cellar :any
    sha1 "21aa20f92e48a6cab0c6005d99e8c55a70f254dd" => :mavericks
    sha1 "48b1ae428858e344d6c62243402a3f7aab626a2d" => :mountain_lion
    sha1 "caf886f0508ebc29eb50e8166f90eefe4b337571" => :lion
  end

  depends_on 'tre'

  def install
    ENV.append 'CFLAGS', '-std=gnu89'
    inreplace 'Makefile', 'LDFLAGS += -static -static-libgcc', ''
    bin.mkpath
    system "make", "prefix=#{prefix}", "install"
  end
end

