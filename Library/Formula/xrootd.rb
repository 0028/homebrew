require 'formula'

class Xrootd < Formula
  homepage 'http://xrootd.org'
  url 'http://xrootd.org/download/v3.3.5/xrootd-3.3.5.tar.gz'
  sha1 '103be7641ef0e7a3a4f6686641a8dc207eb4cf7f'

  bottle do
    cellar :any
    sha1 '16085aad0883e340c62d8dba207a133ba628fa7b' => :mavericks
    sha1 '9e5a14e2bc97321a83512a855087facac9f94113' => :mountain_lion
    sha1 'e30dce443ffdc62c80af680f5a5f4e1486dff125' => :lion
  end

  depends_on 'cmake' => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
    share.install prefix/'man'
  end

  def test
    system "#{bin}/xrootd", "-H"
  end
end
