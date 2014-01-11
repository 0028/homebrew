require 'formula'

class ObjcRun < Formula
  homepage 'https://github.com/iljaiwas/objc-run'
  url 'https://github.com/iljaiwas/objc-run/archive/1.0.tar.gz'
  bottle do
    cellar :any
    sha1 '5e5203303574f938d95d6cdc7e729ffa03cf094a' => :mavericks
    sha1 '362f70d4820f8e2dc72e2a7b267d95afd1c0a95b' => :mountain_lion
    sha1 'cfeece19279791448faf16afc450cf8ee426182c' => :lion
  end

  sha1 "1fcdc44582b608988614e2e96dd5e760d02e8c98"
  head 'https://github.com/iljaiwas/objc-run.git'

  def install
    bin.install 'objc-run'
  end

  test do
    system 'which objc-run'
  end
end
