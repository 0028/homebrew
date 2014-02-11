require "formula"

class Tnote < Formula
  homepage "http://tnote.sourceforge.net/"
  url "http://downloads.sourceforge.net/project/tnote/tnote/tnote-0.2.1/tnote-0.2.1.tar.gz"
  sha1 "8d5d3694b921191c7e91e8907ec6c6970ce29ec6"

  bottle do
    cellar :any
    sha1 "71ba4730d2ffdd831893299a24bf926405a4e49d" => :mavericks
    sha1 "ae60711bb921d081088ce763d16d302be164221f" => :mountain_lion
    sha1 "89cfa0fca878f9fcdc1b5b4ae8a658dfa55e499d" => :lion
  end

  def install
    bin.install 'tnote'
    man1.install 'tnote.1.gz'
  end
end
