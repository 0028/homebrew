require 'formula'

class RabbitmqC < Formula
  homepage 'https://github.com/alanxz/rabbitmq-c'
  url 'https://github.com/alanxz/rabbitmq-c/archive/v0.4.1.tar.gz'
  sha1 '97ceb4039ca5a71b73b417bc7257e263ea1e2f4d'

  head 'https://github.com/alanxz/rabbitmq-c.git'

  bottle do
    cellar :any
    sha1 '47d38510e0769c18f5e74c989a843c9b24e41aa3' => :mavericks
    sha1 'b041bcbf37b987d7e51ac192cbb7d5707372d396' => :mountain_lion
    sha1 'b8ced69ec7cff645db39b709f6f49760820ff8b5' => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build # Use a newer version on Snow Leopard too
  depends_on 'automake' => :build
  depends_on :libtool
  depends_on 'rabbitmq'
  depends_on 'simplejson' => :python if MacOS.version <= :leopard

  resource 'codegen' do
    url 'https://github.com/rabbitmq/rabbitmq-codegen/archive/rabbitmq_v3_2_1.tar.gz'
    sha1 '9fb2453018f499b2188076f5bd6d4cf9a902e90b'
  end

  def install
    ENV.universal_binary if build.universal?
    (buildpath/'codegen').install resource('codegen')
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
