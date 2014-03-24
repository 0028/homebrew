require 'formula'

class Sip < Formula
  homepage 'http://www.riverbankcomputing.co.uk/software/sip'
  url 'http://download.sf.net/project/pyqt/sip/sip-4.15.5/sip-4.15.5.tar.gz'
  sha1 '1e1c912981930754885ba47d708e2664d1c6ba9e'

  bottle do
    sha1 "eeaea7e8a8b34116e0d669ce82edd67c66402cf9" => :mavericks
    sha1 "7eef8ec6236e74050aa5c130d5080e3623e68caa" => :mountain_lion
    sha1 "42f2a0b33010d2437a2a0452949eedefa9dd20b6" => :lion
  end

  head 'http://www.riverbankcomputing.co.uk/hg/sip', :using => :hg

  depends_on :python => :recommended
  depends_on :python3 => :optional

  if build.without?("python3") && build.without?("python")
    odie "sip: --with-python3 must be specified when using --without-python"
  end

  def install
    if build.head?
      # Link the Mercurial repository into the download directory so
      # build.py can use it to figure out a version number.
      ln_s cached_download + ".hg", ".hg"
      # build.py doesn't run with python3
      system "python", "build.py", "prepare"
    end

    Language::Python.each_python(build) do |python, version|
      # Note the binary `sip` is the same for python 2.x and 3.x
      system python, "configure.py",
                     "--deployment-target=#{MacOS.version}",
                     "--destdir=#{lib}/python#{version}/site-packages",
                     "--bindir=#{bin}",
                     "--incdir=#{include}",
                     "--sipdir=#{HOMEBREW_PREFIX}/share/sip"
      system "make"
      system "make", "install"
      system "make", "clean"
    end
  end

  def caveats
    "The sip-dir for Python is #{HOMEBREW_PREFIX}/share/sip."
  end
end
