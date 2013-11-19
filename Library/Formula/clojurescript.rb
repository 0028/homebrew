require 'formula'

class Clojurescript < Formula
  homepage 'https://github.com/clojure/clojurescript'
  url 'https://github.com/clojure/clojurescript/archive/r2030.tar.gz'
  sha1 '9d6ec56da87ab514496e95dc1ee05b6966e92e98'

  bottle do
    sha1 'f36e950451fb00329ed85a47fa94bfc547aa31bd' => :mavericks
    sha1 '075e90fb40a5c5dabe5b2b1d22755fbba7e32265' => :mountain_lion
    sha1 'f7d9ff7d1a518061780e8353f414ecbd97816f8b' => :lion
  end

  head "https://github.com/clojure/clojurescript.git"

  def install
    system "./script/bootstrap"
    inreplace %w(bin/cljsc script/repl script/repljs script/browser-repl),
      "#!/bin/sh", "#!/bin/sh\nCLOJURESCRIPT_HOME=#{libexec}"
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/cljsc'
  end

  def caveats; <<-EOS.undent
    This formula is useful if you need to use the ClojureScript compiler directly.
    For a more integrated workflow, Leiningen with lein-cljsbuild is recommended.
    EOS
  end

  test do
    system "#{bin}/cljsc"
  end
end
