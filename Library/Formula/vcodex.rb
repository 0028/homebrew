require 'formula'

class VcodexDownloadStrategy < CurlDownloadStrategy
  # downloading from AT&T requires using the following credentials
  def credentials
    'I accept www.opensource.org/licenses/eclipse:.'
  end

  def curl(*args)
    args << '--user' << credentials
    super
  end
end

class Vcodex < Formula
  homepage 'http://www2.research.att.com/~astopen/download/ref/vcodex/vcodex.html'
  url 'http://www2.research.att.com/~astopen/download/tgz/vcodex.2013-05-31.tgz',
      :using => VcodexDownloadStrategy
  sha1 '0423ee95b13069dd617c5f7625484a92d5068ea0'
  version '2013-05-31'

  bottle do
    cellar :any
    sha1 '51687bb066f66f392595165f2e440f0000cce1fb' => :mavericks
    sha1 '23c3db3ac9576915286208bbd8a07cf4cff45a89' => :mountain_lion
    sha1 'ed39967e00fd14993f0d2cc3b5fb488e4c4c41fe' => :lion
  end

  def install
    # Vcodex makefiles do not work in parallel mode
    ENV.deparallelize
    # make all Vcodex stuff
    system "/bin/sh ./Runmake"
    # install manually
    bin.install Dir['bin/vc*']
    # put all includes into a directory of their own
    (include + "vcodex").install Dir['include/*.h']
    lib.install Dir['lib/*.a']
    man.install 'man/man3'
  end

  def caveats; <<-EOS.undent
    We agreed to the Eclipse Public License 1.0 for you.
    If this is unacceptable you should uninstall.
    EOS
  end
end
