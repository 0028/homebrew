require 'formula'

class ObjcRun < Formula
  homepage 'https://github.com/iljaiwas/objc-run'
  url 'https://github.com/iljaiwas/objc-run/archive/1.4.tar.gz'
  sha1 '86c15705359f2dc2c62d70e358caf63c2a468fee'
  head 'https://github.com/iljaiwas/objc-run.git'

  bottle do
    cellar :any
    sha1 "ed45a23fc44fa393f999a5da876c226d0c78e723" => :mavericks
    sha1 "55583ee26b1731cfaf68603cedf06e1f31ca90b0" => :mountain_lion
    sha1 "b8fb08dbf62d3b7e22b20d4510bd90cc55066676" => :lion
  end

  def install
    bin.install 'objc-run'
    (share+'objc-run').install Dir['examples', 'test.bash']
  end

  test do
    system "#{(share+'objc-run')}/test.bash"
  end
end
