require 'formula'

class Clojurescript < Formula
  homepage 'https://github.com/clojure/clojurescript'
  head 'https://github.com/clojure/clojurescript.git'
  url 'https://github.com/clojure/clojurescript/archive/r2156.tar.gz'
  sha1 'e95d37ed1c93af606a5825826688be801c65194d'

  bottle do
    sha1 "ecba574f249fdacdb1210526396a56e547f6ef5f" => :mavericks
    sha1 "f978bcd15806f9b78dc7faf9952380e958e0ae56" => :mountain_lion
    sha1 "f554f6368d9d58b4efb940d305ff4ee83e5c2544" => :lion
  end

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
