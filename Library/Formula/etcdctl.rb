require 'formula'

class Etcdctl < Formula
  homepage 'https://github.com/coreos/etcdctl'
  url 'https://github.com/coreos/etcdctl/archive/v0.2.0.tar.gz'
  sha1 '6370bd86f3ab0264cf142db04c367e10e7f64a3d'
  head 'https://github.com/coreos/etcdctl.git'

  bottle do
    sha1 '9c4cef35b81fee106a4b21365eb7a08bb56ca591' => :mavericks
    sha1 'f62c72fb16a19ebda472e9fcf90a3f6090960d77' => :mountain_lion
    sha1 'b6a1ea3e72496e090b5b5f9decd535236d24b95e' => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'etcdctl'
  end
end
