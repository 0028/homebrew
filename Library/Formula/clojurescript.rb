require 'formula'

class Clojurescript < Formula
  homepage 'https://github.com/clojure/clojurescript'
  head 'https://github.com/clojure/clojurescript.git'
  url 'https://github.com/clojure/clojurescript/archive/r2173.tar.gz'
  sha1 'cc4f70980dad5d900cfd42cd5b614dc946c32408'

  bottle do
    cellar :any
    sha1 "14a24e842c645034a1a1e5930fdd315313ad82b3" => :mavericks
    sha1 "7f4544934957551095f254fcf5692aa8ce78d8ec" => :mountain_lion
    sha1 "47ca9a8c18bbc0c1a4d669f083e3e233d1f72447" => :lion
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
