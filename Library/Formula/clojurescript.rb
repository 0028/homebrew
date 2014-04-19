require 'formula'

class Clojurescript < Formula
  homepage 'https://github.com/clojure/clojurescript'
  head 'https://github.com/clojure/clojurescript.git'
  url 'https://github.com/clojure/clojurescript/archive/r2202.tar.gz'
  sha1 'a205d9a21a16e8052995485c30925b6828d1259a'

  bottle do
    cellar :any
    sha1 "c8f03b47484491888942b1eca591586e4629d157" => :mavericks
    sha1 "aef465dd36ca1f368cbb0aa7650a9a3315e97460" => :mountain_lion
    sha1 "f9f324c30064233b7bf973fae7d7a65a9fece007" => :lion
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
