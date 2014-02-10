require 'formula'

class Rebar < Formula
  homepage 'https://github.com/rebar/rebar'
  url 'https://github.com/rebar/rebar/archive/2.2.0.zip'
  sha1 '48e3b6e4293129b990c4e35dc0be5f822c66e08d'

  bottle do
    cellar :any
    sha1 "fa948cad98565d58ab3eaf51c9383d7581c9401e" => :mavericks
    sha1 "7875f4b50e6f8dd0bf2719e85702d9be2640bfce" => :mountain_lion
    sha1 "5457ff2fa1eda66167c54088b10a87f4f7cba5ec" => :lion
  end

  head "https://github.com/basho/rebar.git", :branch => "master"

  depends_on 'erlang'

  def install
    system './bootstrap'
    bin.install 'rebar'
  end

  test do
    system 'rebar', '--version'
  end
end
