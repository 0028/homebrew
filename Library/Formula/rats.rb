require 'formula'

class Rats < Formula
  homepage 'https://security.web.cern.ch/security/recommendations/en/codetools/rats.shtml'
  url 'https://rough-auditing-tool-for-security.googlecode.com/files/rats-2.3.tar.gz'
  sha1 '02283f2a5f0482f09c7e33d2aa84d68c48a8ec5a'

  #depends_on 'expat' => :optional

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--infodir=#{info}"
    #                      "--with-expat-lib=path",
    #                      "--with-expat-include=path"
    system "make install"
  end

  test do
    system "rats"
  end
end
