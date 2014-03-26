require 'formula'

class Gringo < Formula
  homepage 'http://potassco.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/potassco/gringo/4.3.0/gringo-4.3.0-source.tar.gz'
  sha1 'dccb55c2c690ebe1f6599a43b6072bfb50eb5e83'

  bottle do
    cellar :any
    revision 1
    sha1 "76c04377dac344fb8e277dd88a53d675a75d897c" => :mavericks
    sha1 "c4ec7feca189df21bf1d642140ab68d7f859fd71" => :mountain_lion
    sha1 "7de741da8cd2d2c845021797f895b29c74ca3629" => :lion
  end

  depends_on 're2c'  => :build
  depends_on 'scons' => :build
  depends_on 'bison' => :build
  depends_on :macos => :lion

  # Needs C++11
  fails_with :gcc
  fails_with :gcc_4_0

  # Fixes missing include; fixed upstream:
  # http://sourceforge.net/p/potassco/code/8274/tree//trunk/gringo/app/gringo/main.cc?diff=5083e8f9bfc09e133b25ad84:8273
  patch :p3, :DATA

  def install
    # Allow pre-10.9 clangs to build in C++11 mode
    ENV.libcxx
    inreplace "SConstruct",
              "env['CXX']            = 'g++'",
              "env['CXX']            = '#{ENV['CXX']}'"
    scons "--build-dir=release", "gringo", "clingo"
    bin.install "build/release/gringo", "build/release/clingo"
  end
end

__END__
--- a/trunk/gringo/app/gringo/main.cc
+++ b/trunk/gringo/app/gringo/main.cc
@@ -33,6 +33,7 @@
 #include <gringo/scripts.hh>
 #include <gringo/version.hh>
 #include <gringo/control.hh>
+#include <climits>
 #include <iostream>
 #include <stdexcept>
 #include <program_opts/application.h>
