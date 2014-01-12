require 'formula'

class Pdfmarks < Formula
  homepage 'https://bitbucket.org/alexreg/pdfmarks'
  url 'https://bitbucket.org/alexreg/pdfmarks/get/v0.2.tar.gz'
  sha1 '75943601cfb3b8aed110357a152838b86507403b'

  bottle do
    sha1 '014b18c6e2f867638f3c1a531a2ab0545f199e56' => :mavericks
    sha1 '2df01f28b0e4ef74a64ef846664f7f9e1d3a10bd' => :mountain_lion
    sha1 '865648e312d02e82c36c08be428c7b1b52bd9ed2' => :lion
  end

  depends_on 'ghostscript'

  def install
    inreplace 'pdfmarks' do |s|
      s.gsub! "source \"common\"", "source \"#{libexec}/common\""
      s.gsub! "\"pdfmarks.ps\"", "\"#{share}/pdfmarks.ps\""
    end

    share.install 'pdfmarks.ps'
    libexec.install 'common'
    bin.install 'pdfmarks'
  end

  test do
    system "#{bin}/pdfmarks", "-h"
  end
end
