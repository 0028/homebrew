require 'formula'

class IncludeWhatYouUse < Formula
  homepage 'https://code.google.com/p/include-what-you-use/'
  url 'https://doc-00-9o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/82e24tdlmk93f5s0cpudtjq9e68ka4lg/1386907200000/18138411108955853598/*/0ByBfuBCQcURXQktsT3ZjVmZtWkU?h=16653014193614665626&amp;e=download'
  version '3.3'
  sha1 'f49dd094300b648543e3510ebd8101dbab23056f'

  bottle do
    sha1 '6f281cc843859345795a655d92dc40a6da1d5430' => :mavericks
    sha1 '850c43843494a6489041ba129163abcba36a6107' => :mountain_lion
    sha1 '667972f3f10bda478b1310400d764c93ec7648d9' => :lion
  end

  depends_on 'llvm' => [:build, "with-clang"]
  depends_on 'cmake' => :build

  def install
    mkdir '../build-iwyu' do
       system "cmake -DLLVM_PATH=/usr/local/Cellar/llvm/3.3/ ../include-what-you-use -DCMAKE_INSTALL_PREFIX=#{prefix}/"
       system "make install"
    end
    system "cp ../include-what-you-use/fix_includes.py #{prefix}/"
  end
end
