require 'formula'

class Sleuthkit < Formula
  homepage 'http://www.sleuthkit.org/'
  url 'http://downloads.sourceforge.net/project/sleuthkit/sleuthkit/4.1.3/sleuthkit-4.1.3.tar.gz'
  sha1 '9350bb59bb5fbe41d6e29a8d0494460b937749ef'

  bottle do
    sha1 "7ed5d9b6d837800d6fc9f8880b99bf4e7a7f55c7" => :mavericks
    sha1 "007d1563b3119e7caec5cda8d497cb878b88c24a" => :mountain_lion
    sha1 "e7982c66241fa9388ef771d6ab34f263a91466cd" => :lion
  end

  head do
    url 'https://github.com/sleuthkit/sleuthkit.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  conflicts_with 'irods', :because => 'both install `ils`'

  option 'with-jni', "Build Sleuthkit with JNI bindings"

  depends_on :ant
  depends_on 'afflib' => :optional
  depends_on 'libewf' => :optional

  conflicts_with 'ffind',
    :because => "both install a 'ffind' executable."

  def install
    system "./bootstrap" if build.head?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"

    if build.with? 'jni'
      cd 'bindings/java' do
        system 'ant'
      end
      prefix.install 'bindings'
    end
  end
end
