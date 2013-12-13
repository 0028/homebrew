require 'formula'

class Clucene < Formula
  homepage 'http://clucene.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/clucene/clucene-core-stable/0.9.21b/clucene-core-0.9.21b.tar.bz2'
  sha1 '8bc505b64f82723c2dc901036cb0607500870973'

  bottle do
    cellar :any
    sha1 '018a669a372e3b6df66c06392cb349ac0d11e5c3' => :mavericks
    sha1 'b640ba719fd611ce503bffd770159297598a9bdc' => :mountain_lion
    sha1 '42c6a24951f7f05e47eb83f619c60f2736a55b1e' => :lion
  end

  head do
    url 'git://clucene.git.sourceforge.net/gitroot/clucene/clucene'
    depends_on 'cmake' => :build
  end

  def patches
    if MacOS.version >= :mavericks
      # Fix libpthread dependencies in OS X 10.9
      # Based on MacPorts patches: http://trac.macports.org/ticket/40899
      # Reported upstream: http://sourceforge.net/p/clucene/bugs/219/
      {:p0 => [
        'https://gist.github.com/tlvince/7934499/raw/d0859996dbda8f4cf643d091ae6b491f0a64da59/CLucene-LuceneThreads.h.diff',
        'https://gist.github.com/tlvince/7935339/raw/fd78b1ada278eaf1904e1437efa0f2a1265041a9/CLucene-config-repl_tchar.h.diff'
      ]}
    end
  end

  def install
    if build.head?
      system "cmake", ".", *std_cmake_args
    else
      system "./configure", "--disable-debug", "--disable-dependency-tracking",
                            "--prefix=#{prefix}"
    end

    # Serialize the install step. See:
    # https://github.com/mxcl/homebrew/issues/8712
    ENV.j1
    system "make install"
  end
end
