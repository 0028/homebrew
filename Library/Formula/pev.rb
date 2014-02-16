require 'formula'

class Pev < Formula
  homepage 'http://pev.sf.net/'
  url 'http://downloads.sourceforge.net/project/pev/pev-0.70/pev-0.70.tar.gz'
  sha1 'b2d1191c3b57049c78ef77b8f54f7f78838af129'

  head 'https://github.com/merces/pev.git'

  bottle do
    cellar :any
    sha1 "2db89c8fc7ce0c4c5ac2ef6068e5a355a0cca3e9" => :mavericks
    sha1 "2d14b11d5243e30139e2e43bf42de796bc2da89f" => :mountain_lion
    sha1 "29f04beab17f53015a76cba4a356392fdc7c94a8" => :lion
  end

  depends_on 'pcre'

  def install
    inreplace 'src/Makefile' do |s|
      s.gsub! '/usr', prefix
      s.change_make_var! "SHAREDIR", share
      s.change_make_var! "MANDIR", man
    end

    inreplace 'lib/libpe/Makefile' do |s|
      s.gsub! '/usr', prefix
    end

    system "make", "CC=#{ENV.cc}"
    system "make install"
  end

  test do
    system "#{bin}/pedis", "--version"
  end
end
