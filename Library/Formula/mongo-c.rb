require 'formula'

class MongoC < Formula
  homepage 'http://docs.mongodb.org/ecosystem/drivers/c/'
  url 'https://github.com/mongodb/mongo-c-driver/releases/download/0.94.2/mongo-c-driver-0.94.2.tar.gz'
  sha1 '5cc4dbb6298323f978de2a7367fe7ca50922037c'

  bottle do
    cellar :any
    sha1 "43c75e9f67414babd6722f5ad5c190e3f50be3e9" => :mavericks
    sha1 "8e1354d0f4730341b83bb73c08d433b637c53509" => :mountain_lion
    sha1 "7e0aabd8d611701843271020a8f65c5c11477127" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'libbson'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
