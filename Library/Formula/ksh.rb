require 'formula'

class KshDownloadStrategy < NoUnzipCurlDownloadStrategy
  # AT&T requires the following credentials to "assent" to the OSS license.
  def credentials
    'I.accept.www.opensource.org.licenses.eclipse:.'
  end

  def curl(*args)
    args << '-u' << credentials
    super
  end
end

class Ksh < Formula
  homepage 'http://www.kornshell.com'
  url  'http://www2.research.att.com/~astopen/download/tgz/ast-ksh.2012-08-01.tgz',
    :using => KshDownloadStrategy
  sha1 '316428e9937806183a134aa1669dea40c3a73695'
  bottle do
    cellar :any
    sha1 "319ff38f52e892d7532e4d99eee751c556d16e43" => :mavericks
    sha1 "6182bca6002a2c83663c0df79d9502d9256d29f6" => :mountain_lion
    sha1 "6b5091d8170901786c42e719bb7777d72f38c48e" => :lion
  end

  version '93u+' # Versioning scheme: + means "+ patches", - means "beta/alpha".

  resource 'init' do
    url 'http://www2.research.att.com/~astopen/download/tgz/INIT.2012-08-01.tgz',
      :using => KshDownloadStrategy
    sha1 '0b472a615db384fe707042baaa3347dc1aa1c81e'
  end

  def install
    (buildpath / 'lib/package/tgz').install resource('init'), Dir['*.tgz']

    system 'tar xzf lib/package/tgz/INIT*'
    system '/bin/ksh bin/package read'

    # Needed due to unusal build system.
    ENV['HOMEBREW_CCCFG'] += 'O'

    # From Apple's ksh makefile.
    kshcppdefines = '-DSHOPT_SPAWN=0 -D_ast_int8_t=int64_t -D_lib_memccpy'

    system "/bin/ksh bin/package make CCFLAGS='#{kshcppdefines}'"

    bin.install Dir['arch/*/bin/ksh'] => 'ksh93'
    man1.install Dir['arch/*/man/man1/sh.1'] => 'ksh93.1'

    ln_s bin / 'ksh93', bin / 'ksh'
    ln_s bin / 'ksh93.1', bin / 'ksh.1'
  end

  def caveats; <<-EOS.undent
    We have agreed to the Eclipse Public License on your behalf.
    If this is unacceptable for any reason, please uninstall.
    EOS
  end
end
