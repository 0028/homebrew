require 'formula'

class Logentries < Formula
  homepage 'https://logentries.com/doc/agent/'
  url 'https://github.com/logentries/le/archive/v1.2.17.tar.gz'
  sha1 'cf961dd02a3f5df367f8435478e4362b8190b3d2'

  bottle do
    cellar :any
    sha1 "d83e4f1e761b2aa455df192f188b77eba2bc3cf1" => :mavericks
    sha1 "9c7af4925d6210f3cf131b8e1e32696470f5dfdf" => :mountain_lion
    sha1 "40868a58545935bd492d0cc647d8e8b3518c059b" => :lion
  end

  conflicts_with 'le', :because => 'both install a le binary'

  def install
    bin.install 'le'
  end
end
