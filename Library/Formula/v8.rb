require 'formula'

# When trunk is 3.x, then 3.x is devel and 3.(x-1)
# is stable.
# https://code.google.com/p/v8/issues/detail?id=2545
# http://omahaproxy.appspot.com/

class V8 < Formula
  homepage 'http://code.google.com/p/v8/'
  url 'https://github.com/v8/v8/archive/3.19.18.4.tar.gz'
  sha1 'f44c8eed0fe93b2d04d1d547a1e2640f41161354'

  bottle do
    cellar :any
    sha1 'd17716c427c0d7f6cf287fbd43689d4b59ea4471' => :mavericks
    sha1 '6c0c8f7c0c4e8edfbfb8b3dd4ee185d71b3c984b' => :mountain_lion
    sha1 'b227a126ccd3a5b6ff18dee7ad366eb4eb775dce' => :lion
  end

  devel do
    url 'https://github.com/v8/v8/archive/3.20.12.tar.gz'
    sha1 '1463f4b8b33674bfd366e84b739713a727e9f9ac'
  end

  head 'https://github.com/v8/v8.git'

  option 'with-readline', 'Use readline instead of libedit'

  # not building on Snow Leopard:
  # https://github.com/mxcl/homebrew/issues/21426
  depends_on :macos => :lion

  # gyp currently depends on a full xcode install
  # https://code.google.com/p/gyp/issues/detail?id=292
  depends_on :xcode
  depends_on 'readline' => :optional

  def install
    system 'make dependencies'
    system 'make', 'native',
                   "-j#{ENV.make_jobs}",
                   "library=shared",
                   "snapshot=on",
                   "console=readline"

    prefix.install 'include'
    cd 'out/native' do
      lib.install Dir['lib*']
      bin.install 'd8', 'lineprocessor', 'preparser', 'process', 'shell' => 'v8'
      bin.install Dir['mksnapshot.*']
    end
  end
end
