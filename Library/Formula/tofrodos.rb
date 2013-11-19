require 'formula'

class Tofrodos < Formula
  homepage 'http://www.thefreecountry.com/tofrodos/'
  url 'http://tofrodos.sourceforge.net/download/tofrodos-1.7.13.tar.gz'
  sha1 '665cff074a19030705eb80274f483f20aa24b38e'

  bottle do
    cellar :any
    sha1 '0b202ee68e396d11f21b6198bd984d2f1e089c68' => :mavericks
    sha1 '2704524ecac19cf5545c19e1ccb44e3fd511f35a' => :mountain_lion
    sha1 '9bb1edbba57be03d4fc59c328da9f19bf3970685' => :lion
  end

  def install
    cd 'src' do
      system "make"
      bin.install %w[todos fromdos]
      man1.install "fromdos.1"
      ln_s man1+'fromdos.1', man1+'todos.1'
    end
  end
end
