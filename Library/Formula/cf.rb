require 'formula'

class Cf < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  url 'https://github.com/cloudfoundry/cli.git', :tag => 'v6.0.0'
  version '6.0.0-beta'

  bottle do
    sha1 "b4106ed08ff473d6e05c7df290590987c33f2210" => :mavericks
    sha1 "b135ef4c08855a4ddad7bc7329791dd78fe4594a" => :mountain_lion
    sha1 "5dc0a98eca186cc1bea92e3426b88d89cbd4e225" => :lion
  end

  head 'https://github.com/cloudfoundry/cli.git', :branch => 'master'

  depends_on 'go' => :build

  def install
    system 'sed -i "" -e "s/SHA/homebrew/g" src/cf/app_constants.go'
    system 'bin/build'
    bin.install 'out/cf'
  end

  test do
    system "#{bin}/cf"
  end
end
