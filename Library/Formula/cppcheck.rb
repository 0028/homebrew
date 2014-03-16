require 'formula'

class Cppcheck < Formula
  homepage 'http://sourceforge.net/apps/mediawiki/cppcheck/index.php?title=Main_Page'
  url 'https://github.com/danmar/cppcheck/archive/1.64.tar.gz'
  sha1 'feaa8b3333c20f950a38026461ff407de4ef1ba0'

  head 'https://github.com/danmar/cppcheck.git'

  bottle do
    sha1 "6b9fd4a8b6e44a131cc2e3d0f09e356e5c74683b" => :mavericks
    sha1 "469b300c14e497b3bb7e512b1a11ea6bb5d3de37" => :mountain_lion
    sha1 "263e0f411d938ae8970fc3a5eca3b2366a3b554b" => :lion
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
