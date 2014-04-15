require "formula"

class Emscripten < Formula
  homepage "http://emscripten.org"
  url "https://github.com/kripken/emscripten/archive/1.14.1.tar.gz"
  sha1 "4868dcecf218a5af76c58a9938b6df1216a68ccf"

  head "https://github.com/kripken/emscripten.git", :branch => 'incoming'

  head do
    resource 'fastcomp' do
      url "https://github.com/kripken/emscripten-fastcomp.git", :branch => 'incoming'
    end

    resource 'fastcomp-clang' do
      url "https://github.com/kripken/emscripten-fastcomp-clang.git", :branch => 'incoming'
    end
  end

  stable do
    resource 'fastcomp' do
      url "https://github.com/kripken/emscripten-fastcomp/archive/1.14.1.tar.gz"
      sha1 "84cdc3b8406ab998a9eb6b02e303e8ba4783ef19"
    end

    resource 'fastcomp-clang' do
      url "https://github.com/kripken/emscripten-fastcomp-clang/archive/1.14.1.tar.gz"
      sha1 "40e74a4d415ff0f882465f24c21e0f0169efd40e"
    end
  end

  depends_on "node"
  depends_on "closure-compiler" => :optional
  depends_on "yuicompressor"

  def install
    python2EnvScripts = [
      "em++",
      "em-config",
      "emar",
      "emcc",
      "emcmake",
      "emconfigure",
      "emlink.py",
      "emmake",
      "emranlib",
      "emscons",
      "emscripten.py",
      "system/bin/sdl-config",
      "tests/freetype/src/tools/chktrcmp.py",
      "tests/freetype/src/tools/docmaker/docbeauty.py",
      "tests/freetype/src/tools/docmaker/docmaker.py",
      "tests/freetype/src/tools/glnames.py",
      "tests/python/ccproxy.py",
      "tests/runner.py",
      "third_party/CppHeaderParser/setup.py",
      "third_party/websockify/websockify/websocket.py",
      "third_party/websockify/websockify/websocketproxy.py",
      "tools/bindings_generator.py",
      "tools/emconfiguren.py",
      "tools/emmaken.py",
      "tools/emmakenxx.py",
      "tools/fix_closure.py",
      "tools/merge_asm.py",
      "tools/nativize_llvm.py",
      "tools/reproduceriter.py",
      "tools/scons/site_scons/site_tools/emscripten/__init__.py",
      "tools/scons/site_scons/site_tools/emscripten/emscripten.py",
      "tools/split_asm.py"
    ]

    if build.head?
      python2EnvScripts << "tools/traverse.py"
    end

    python2Scripts = [
      "third_party/CppHeaderParser/CppHeaderParser/CppHeaderParser.py",
      "third_party/demangler.py",
      "third_party/websockify/run",
      "tools/exec_llvm.py",
      "tools/ll-strip.py",
      "tools/namespacer.py"
    ]

    # note - OS X doesn't provide a python2 binary. Use the default python
    # instead
    inreplace python2EnvScripts, '#!/usr/bin/env python2', '#!/usr/bin/env python'
    inreplace python2Scripts, '#!/usr/bin/python2', '#!/usr/bin/env python'

    # There's no make install, just recusively copy the source.
    # Note - as per documentation, _all_ files from the repository are
    # required, as emscripten is just a collection of scripts that include
    # each other.
    libexec.install Dir['*']

    resource('fastcomp').stage do
      (buildpath/'fastcomp/').install Dir['*']
    end

    resource('fastcomp-clang').stage do
      (buildpath/'fastcomp/tools/clang').install Dir['*']
    end

    args = [
      "--prefix=#{libexec}/llvm",
      "--enable-optimized",
      "--enable-targets=host,js",
      "--disable-assertions",
      "--disable-bindings",
    ]

    cd "fastcomp" do
      system "./configure", *args
      system 'make'
      system 'make', 'install'
    end

    bin.install_symlink libexec/"em++"
    bin.install_symlink libexec/"em-config"
    bin.install_symlink libexec/"emar"
    bin.install_symlink libexec/"emcc"
    bin.install_symlink libexec/"emconfigure"
    bin.install_symlink libexec/"emlink.py"
    bin.install_symlink libexec/"emmake"
    bin.install_symlink libexec/"emranlib"
    bin.install_symlink libexec/"emrun"
    bin.install_symlink libexec/"emscons"
  end

  test do
    system "#{libexec}/llvm/bin/llvm-config", "--version"
  end

  def caveats; <<-EOS.undent
    Manually set LLVM_ROOT to \"#{opt_prefix}/libexec/llvm/bin\"
    in ~/.emscripten after running emcc for the first time.
    EOS
  end
end
