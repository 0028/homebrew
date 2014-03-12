require 'formula'

# Note that x.even are stable releases, x.odd are devel releases
class Node < Formula
  homepage 'http://nodejs.org/'
  url 'http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz'
  sha1 '2340ec2dce1794f1ca1c685b56840dd515a271b2'

  bottle do
    sha1 "e2126dc7b0a4cd3a9367e843eff986807cee2036" => :mavericks
    sha1 "4748e817fa1eda65cae2a0087cf944a3cbedc665" => :mountain_lion
    sha1 "fa144e97178e5341014df0e51c65713f03516343" => :lion
  end

  devel do
    url 'http://nodejs.org/dist/v0.11.12/node-v0.11.12.tar.gz'
    sha1 'd991057af05dd70feb2126469ce279a2fe869e86'
  end

  head 'https://github.com/joyent/node.git'

  option 'enable-debug', 'Build with debugger hooks'

  depends_on :python

  fails_with :llvm do
    build 2326
  end

  def install
    args = %W{--prefix=#{prefix}}

    args << "--debug" if build.include? 'enable-debug'

    system "./configure", *args
    system "make install"
  end

  def caveats; <<-EOS.undent
      Homebrew has NOT installed npm. If you want npm (you do right?)
      then view the install instructions here:

      https://www.npmjs.org/doc/README.html#Fancy-Install-Unix

      It's easy.
    EOS
  end

  test do
    path = testpath/"test.js"
    path.write "console.log('hello');"

    output = `#{bin}/node #{path}`.strip
    assert_equal "hello", output
    assert_equal 0, $?.exitstatus
  end
end
