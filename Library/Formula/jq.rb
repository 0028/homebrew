require 'formula'

class Jq < Formula
  homepage 'http://stedolan.github.io/jq/'
  url 'http://stedolan.github.io/jq/download/source/jq-1.3.tar.gz'
  sha1 'ac1f19e5d9921683af25251e97c2c4bfee895ca2'

  bottle do
    cellar :any
    sha1 "5358e47be7be931f788c7b7db98092a09c9ec19b" => :mavericks
    sha1 "f44a83d78155226001ec0adde12017e711e71ebb" => :mountain_lion
    sha1 "fe0354b616b9d61ca9ab80e3e865d7f64497ae14" => :lion
  end

  head do
    url 'https://github.com/stedolan/jq.git'

    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'libtool' => :build
    depends_on 'bison' => :build
  end

  def install
    system "autoreconf", "-iv" if build.head?
    system "./configure"
    system "make"
    bin.install 'jq'
    man1.install 'jq.1'
  end

  test do
    IO.popen("#{bin}/jq .bar", "w+") do |pipe|
      pipe.puts '{"foo":1, "bar":2}'
      pipe.close_write
      assert_equal "2\n", pipe.read
    end
  end
end
