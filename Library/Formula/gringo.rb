require 'formula'

class Gringo < Formula
  homepage 'http://potassco.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/potassco/gringo/4.3.0/gringo-4.3.0-source.tar.gz'
  sha1 'dccb55c2c690ebe1f6599a43b6072bfb50eb5e83'

  bottle do
    cellar :any
    revision 1
    sha1 "a4bcea81323142f44cc6bca3b551e2abb24fccd0" => :mavericks
    sha1 "467d8c17afaf8cfdec468fbe19a95f05758c54fb" => :mountain_lion
  end

  depends_on 're2c'  => :build
  depends_on 'scons' => :build
  depends_on 'bison' => :build
  depends_on :macos => :mountain_lion

  def install
    # The scons file in the package rewrites the CXX variable, so
    # we need to patch it to swap in the correct compilers.
    inreplace "SConstruct",
              "env['CXX']            = 'g++'",
              "env['CXX']            = 'clang++'"
    inreplace "SConstruct",
              "env['CXXFLAGS']   = ['-std=c++11', '-O3', '-Wall']",
              "env['CXXFLAGS']   = ['-std=c++11', '-stdlib=libc++', '-O3', '-Wall']"
    inreplace "SConstruct",
              "env['LINKFLAGS']  = ['-std=c++11', '-O3']",
              "env['LINKFLAGS']  = ['-std=c++11', '-stdlib=libc++', '-O3']"
    scons "--build-dir=release", "gringo", "clingo"
    bin.install "build/release/gringo", "build/release/clingo"
  end
end
