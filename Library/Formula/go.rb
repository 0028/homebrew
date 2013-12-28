require 'formula'

class Go < Formula
  homepage 'http://golang.org'
  head 'https://go.googlecode.com/hg/'
  url 'https://go.googlecode.com/files/go1.2.src.tar.gz'
  version '1.2'
  sha1 '7dd2408d40471aeb30a9e0b502c6717b5bf383a5'

  bottle do
    revision 1
    sha1 '8e62570742d97f3407189c5b5a8c72cdb9b11be0' => :mavericks
    sha1 '7542dec6c637ee4fdafced023dd5298a1b996784' => :mountain_lion
    sha1 'e1aad974d5ac501ff6c322042a2ee53774e3288a' => :lion
  end

  option 'cross-compile-all', "Build the cross-compilers and runtime support for all supported platforms"
  option 'cross-compile-common', "Build the cross-compilers and runtime support for darwin, linux and windows"
  option 'without-cgo', "Build without cgo"

  def install
    # install the completion scripts
    bash_completion.install 'misc/bash/go' => 'go-completion.bash'
    zsh_completion.install 'misc/zsh/go' => 'go'

    # host platform (darwin) must come last in the targets list
    if build.include? 'cross-compile-all'
      targets = [
        ['linux',   ['386', 'amd64', 'arm']],
        ['freebsd', ['386', 'amd64']],
        ['netbsd',  ['386', 'amd64']],
        ['openbsd', ['386', 'amd64']],
        ['windows', ['386', 'amd64']],
        ['darwin',  ['386', 'amd64']],
      ]
    elsif build.include? 'cross-compile-common'
      targets = [
        ['linux',   ['386', 'amd64', 'arm']],
        ['windows', ['386', 'amd64']],
        ['darwin',  ['386', 'amd64']],
      ]
    else
      targets = [['darwin', ['']]]
    end

    # The version check is due to:
    # http://codereview.appspot.com/5654068
    (buildpath/'VERSION').write('default') if build.head?

    cd 'src' do
      targets.each do |os, archs|
        cgo_enabled = os == 'darwin' && build.with?('cgo') ? "1" : "0"
        archs.each do |arch|
          ENV['GOROOT_FINAL'] = libexec
          ENV['GOOS']         = os
          ENV['GOARCH']       = arch
          ENV['CGO_ENABLED']  = cgo_enabled
          system "./make.bash", "--no-clean"
        end
      end
    end

    (buildpath/'pkg/obj').rmtree

    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    As of go 1.2, a valid GOPATH is required to use the `go get` command:
      http://golang.org/doc/code.html#GOPATH

    `go vet` and `go doc` are now part of the go.tools sub repo:
      http://golang.org/doc/go1.2#go_tools_godoc

    To get `go vet` and `go doc` run:
      go get code.google.com/p/go.tools/cmd/godoc
      go get code.google.com/p/go.tools/cmd/vet

    Add the GOROOT-based install location to your path
      export GOROOT=`go env GOROOT`
      export PATH=$PATH:$GOROOT/bin
    EOS
  end

  test do
    (testpath/'hello.go').write <<-EOS.undent
    package main

    import "fmt"

    func main() {
        fmt.Println("Hello World")
    }
    EOS
    # Run go fmt check for no errors then run the program.
    # This is a a bare minimum of go working as it uses fmt, build, and run.
    system "#{bin}/go", "fmt", "hello.go"
    assert_equal "Hello World\n", `#{bin}/go run hello.go`
  end
end
