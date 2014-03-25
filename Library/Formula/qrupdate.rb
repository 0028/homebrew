require 'formula'

class Qrupdate < Formula
  homepage 'http://sourceforge.net/projects/qrupdate/'
  url 'https://downloads.sourceforge.net/qrupdate/qrupdate-1.1.2.tar.gz'
  sha1 'f7403b646ace20f4a2b080b4933a1e9152fac526'

  bottle do
    cellar :any
    sha1 "8029bdb00c4823cacfd784d2302db22423210f73" => :mavericks
    sha1 "ed72a63f71a552f875302ed3a898ddcc5df0578d" => :mountain_lion
    sha1 "b0ca70fa2739021e6163b8643a4e8ac0deb1af85" => :lion
  end

  depends_on :fortran
  depends_on "homebrew/science/openblas" => :optional

  def install
    ENV.j1
    ENV['PREFIX'] = prefix
    if build.with? 'openblas'
      fflags = ENV.fcflags
      lflags = "#{ENV.ldflags} -L#{Formula["openblas"].lib} -lopenblas"
    else
      # We're using the -ff2c flag here to avoid having to depend on dotwrp.
      # Because qrupdate exports only subroutines, the resulting library is
      # compatible with packages compiled with or without the -ff2c flag.
      fflags = "#{ENV.fcflags} -ff2c"
      lflags = "#{ENV.ldflags} -framework Accelerate"
    end
    inreplace 'Makeconf' do |s|
      s.change_make_var! 'FC', ENV.fc
      s.change_make_var! 'FFLAGS', fflags
      s.change_make_var! 'BLAS',   lflags
      s.change_make_var! 'LAPACK', ""
    end
    cd "./src"
    inreplace 'Makefile' do |s|
      s.gsub! 'install -D', 'install'
    end
    lib.mkpath
    system 'make install'
  end
end
