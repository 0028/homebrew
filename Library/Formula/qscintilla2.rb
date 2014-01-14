require 'formula'

class Qscintilla2 < Formula
  homepage 'http://www.riverbankcomputing.co.uk/software/qscintilla/intro'
  url 'http://downloads.sf.net/project/pyqt/QScintilla2/QScintilla-2.8/QScintilla-gpl-2.8.tar.gz'
  sha1 '3edf9d476d4e6af0706a4d33401667a38e3a697e'

  bottle do
    cellar :any
    sha1 'e9eee46d686be9b78838149a1b027e02a9de4d51' => :mavericks
    sha1 'eeb6583cf6f578c7986c9f4e455333c0858a491f' => :mountain_lion
    sha1 'ea4889509716519792885e2d0ee19e275244d928' => :lion
  end

  depends_on 'pyqt'
  depends_on 'sip'

  def install
    # On Mavericks we want to target libc++, this requires a unsupported/macx-clang-libc++ flag
    if ENV.compiler == :clang and MacOS.version >= :mavericks
      spec = "unsupported/macx-clang-libc++"
    else
      spec = "macx-g++"
    end
    args = %W[-config release -spec #{spec}]

    cd 'Qt4Qt5' do
      inreplace 'qscintilla.pro' do |s|
        s.gsub! '$$[QT_INSTALL_LIBS]', lib
        s.gsub! "$$[QT_INSTALL_HEADERS]", include
        s.gsub! "$$[QT_INSTALL_TRANSLATIONS]", "#{prefix}/trans"
        s.gsub! "$$[QT_INSTALL_DATA]", "#{prefix}/data"
      end

      system "qmake", "qscintilla.pro", *args
      system "make"
      system "make", "install"
    end

    cd 'Python' do
      (share/"sip").mkpath
      system 'python', 'configure.py', "-o", lib, "-n", include,
                       "--apidir=#{prefix}/qsci",
                       "--destdir=#{lib}/python2.7/site-packages/PyQt4",
                       "--qsci-sipdir=#{share}/sip",
                       "--pyqt-sipdir=#{HOMEBREW_PREFIX}/share/sip",
                       "--spec=#{spec}"
      system 'make'
      system 'make', 'install'
    end
  end
end
