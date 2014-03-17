require 'formula'

class ObjectiveCaml < Formula
  homepage 'http://ocaml.org'
  url 'http://caml.inria.fr/pub/distrib/ocaml-4.01/ocaml-4.01.0.tar.gz'
  sha1 '31ae98051d42e038f4fbc5fd338c4fa5c36744e0'

  head 'http://caml.inria.fr/svn/ocaml/trunk', :using => :svn

  depends_on :x11 if MacOS::X11.installed?

  patch do
    url 'https://gist.githubusercontent.com/nox/9589142/raw'
    sha1 '89ac45e89bfb1239a5920df230b8c3b80ba5b7dd'
  end

  bottle do
    revision 2
    sha1 "8dc7dc4e266c05309b042e40d517d7f1ae201067" => :mavericks
    sha1 "fac47129995897afa4085a8284699aca4ee91ac7" => :mountain_lion
    sha1 "7ffab3203e8c8a4ac374bab1600f02a63220fdcd" => :lion
  end

  def install
    system "./configure", "--prefix", HOMEBREW_PREFIX,
                          "--mandir", man,
                          "-cc", ENV.cc,
                          "-with-debug-runtime",
                          "-aspp", "#{ENV.cc} -c"
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make world"
    system "make opt"
    system "make opt.opt"
    system "make", "PREFIX=#{prefix}", "install"

    # site-lib in the Cellar will be a symlink to the HOMEBREW_PREFIX location,
    # which is mkpath'd by Keg#link when something installs into it
    ln_s HOMEBREW_PREFIX/"lib/ocaml/site-lib", lib/"ocaml/site-lib"
  end
end
