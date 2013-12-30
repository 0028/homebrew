require 'formula'

class Qscintilla2 < Formula
  homepage 'http://www.riverbankcomputing.co.uk/software/qscintilla/intro'
  url 'http://downloads.sf.net/project/pyqt/QScintilla2/QScintilla-2.8/QScintilla-gpl-2.8.tar.gz'
  sha1 '3edf9d476d4e6af0706a4d33401667a38e3a697e'

  bottle do
    cellar :any
    sha1 '7538a6b6523daf68c02bb32c8a1cbd0a5218e470' => :mavericks
    sha1 '9841ffc894251443807396978f364e23dfa7cb0f' => :mountain_lion
    sha1 'a34fcbc1b943c1c2d6dae13aea726acdf9487ee2' => :lion
  end

  depends_on 'pyqt'
  depends_on 'sip'
  depends_on :python

  def install

    cd 'Qt4Qt5' do
      inreplace 'qscintilla.pro' do |s|
        s.gsub! '$$[QT_INSTALL_LIBS]', lib
        s.gsub! "$$[QT_INSTALL_HEADERS]", include
        s.gsub! "$$[QT_INSTALL_TRANSLATIONS]", "#{prefix}/trans"
        s.gsub! "$$[QT_INSTALL_DATA]", "#{prefix}/data"
      end

      system "qmake", "qscintilla.pro"
      system "make"
      system "make", "install"
    end

    python do
      cd 'Python' do
        (share/"sip#{python.if3then3}").mkpath
        system python, 'configure.py', "-o", lib, "-n", include,
                         "--apidir=#{prefix}/qsci",
                         "--destdir=#{python.site_packages}/PyQt4",
                         "--qsci-sipdir=#{share}/sip#{python.if3then3}",
                         "--pyqt-sipdir=#{HOMEBREW_PREFIX}/share/sip#{python.if3then3}"
        system 'make'
        system 'make', 'install'
      end
    end
  end

  def caveats
    python.standard_caveats if python
  end

end
