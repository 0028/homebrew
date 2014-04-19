require 'formula'

class Libbson < Formula
  homepage 'https://github.com/mongodb/libbson'
  url 'https://github.com/mongodb/libbson/releases/download/0.6.8/libbson-0.6.8.tar.gz'
  sha1 '96f7bb4bcc6a5b1e40e1c9179d96212f8846c1dc'

  bottle do
    cellar :any
    sha1 "321908c82c107fa4e1a2830b6e683f2351b38092" => :mavericks
    sha1 "98fc44c7f172ec099a945464275e98745be608fc" => :mountain_lion
    sha1 "b7ce0fdd33581583cbbfce29fa5a00177fd2f5f1" => :lion
  end

  depends_on :automake

  def install
    system "./configure", "--enable-silent-rules", "--prefix=#{prefix}"
    system "make", "install"
  end
end
