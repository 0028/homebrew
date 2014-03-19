require 'formula'

class MongoC < Formula
  homepage 'http://docs.mongodb.org/ecosystem/drivers/c/'
  url 'https://github.com/mongodb/mongo-c-driver/releases/download/0.92.0/mongo-c-driver-0.92.0.tar.gz'
  sha1 'ca22f3ef44f1c8f6d23446936cc22027abc14dfc'

  bottle do
    cellar :any
    sha1 "552505f9724f0a041fd6a9a84e0606bfcd9810f5" => :mavericks
    sha1 "0706e287046cfc413855203043e8825b26ad4531" => :mountain_lion
    sha1 "ab4ccd93fadc4356d08b2bfeb4cdc25faec21b8e" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'libbson'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
