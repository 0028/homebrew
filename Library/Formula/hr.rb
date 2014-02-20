require 'formula'

class Hr < Formula
  homepage 'https://github.com/LuRsT/hr'
  url 'https://github.com/LuRsT/hr/archive/1.1.tar.gz'
  sha1 '72e0a7836fe5181205de816bb5e0d44be3a8961f'

  bottle do
    cellar :any
    sha1 "4dd08997dc4651ec959b781521d4ed1613e7dc47" => :mavericks
    sha1 "0e9eeb28d78f7ca63d1653c087b76224c7fc4639" => :mountain_lion
    sha1 "73aae0fa5409e6887377a83116e7e3864f6244a1" => :lion
  end

  head 'https://github.com/LuRsT/hr', :branch => 'master'

  def install
    bin.install 'hr'
    man1.install 'hr.1'
  end

  test do
    system "#{bin}/hr", "-#-"
  end
end
