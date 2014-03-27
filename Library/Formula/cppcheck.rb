require 'formula'

class Cppcheck < Formula
  homepage 'http://sourceforge.net/apps/mediawiki/cppcheck/index.php?title=Main_Page'
  url 'https://github.com/danmar/cppcheck/archive/1.64.tar.gz'
  sha1 'feaa8b3333c20f950a38026461ff407de4ef1ba0'

  head 'https://github.com/danmar/cppcheck.git'

  bottle do
    sha1 "f5bf66dc37d240499a67991182943307c39d7c39" => :mavericks
    sha1 "e12b5fe7ebfad04b15e58460b5ff20b2ef55edca" => :mountain_lion
    sha1 "3a8bf8c989a6f6b6ed83f443a0f693a3b3a8f66d" => :lion
  end

  option 'no-rules', "Build without rules (no pcre dependency)"
  option 'with-gui', "Build the cppcheck gui (requires Qt)"

  depends_on 'pcre' unless build.include? 'no-rules'
  depends_on 'qt' if build.with? "gui"

  def install
    # Man pages aren't installed as they require docbook schemas.

    # Pass to make variables.
    if build.include? 'no-rules'
      system "make", "HAVE_RULES=no", "CFGDIR=#{prefix}/cfg"
    else
      system "make", "HAVE_RULES=yes", "CFGDIR=#{prefix}/cfg"
    end

    system "make", "DESTDIR=#{prefix}", "BIN=#{bin}", "CFGDIR=#{prefix}/cfg", "install"
    prefix.install "cfg"

    if build.with? "gui"
      cd "gui" do
        # fix make not finding cfg directory:
        # https://github.com/Homebrew/homebrew/issues/27756
        inreplace "gui.qrc", "../cfg/", "#{prefix}/cfg/"

        if build.include? 'no-rules'
          system "qmake", "HAVE_RULES=no"
        else
          system "qmake"
        end

        system "make"
        bin.install "cppcheck-gui.app"
      end
    end
  end

  test do
    system "#{bin}/cppcheck", "--version"
  end
end
