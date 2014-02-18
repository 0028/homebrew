require 'formula'

class Phantomjs < Formula
  homepage 'http://www.phantomjs.org/'
  url 'https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-source.zip'
  sha1 '124b017d493d5ccabd22afaf078d0650ac048840'

  bottle do
    cellar :any
    revision 1
    sha1 "5ec65e76bc0d2226f9f7d638f18886b37cf716c0" => :mavericks
    sha1 "026a7cbf4ac6588b33c6ed277e056ae4ddf41054" => :mountain_lion
    sha1 "e1ebe0051cc9ff956c09adbad0841bb669c9e8c3" => :lion
  end

  def patches
    [
      'https://github.com/ariya/phantomjs/commit/fe6a96.patch'
    ]
  end

  def install
    inreplace 'src/qt/preconfig.sh', '-arch x86', '-arch x86_64' if MacOS.prefer_64_bit?
    args = ['--confirm', '--qt-config']
    # we have to disable these to avoid triggering Qt optimization code
    # that will fail in superenv (in --env=std, Qt seems aware of this)
    args << '-no-3dnow -no-ssse3' if superenv?
    system './build.sh', *args
    bin.install 'bin/phantomjs'
    (share+'phantomjs').install 'examples'
  end

  test do
    path = testpath/"test.js"
    path.write <<-EOS
      console.log('hello');
      phantom.exit();
    EOS

    output = `#{bin}/phantomjs #{path}`.strip
    assert_equal "hello", output
    assert_equal 0, $?.exitstatus
  end
end
