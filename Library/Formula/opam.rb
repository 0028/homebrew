require 'formula'

class Opam < Formula
  homepage 'https://opam.ocaml.org'
  url 'https://github.com/ocaml/opam/archive/1.1.1.tar.gz'
  sha1 'f1a8291eb888bfae4476ee59984c9a30106cd483'

  head 'https://github.com/ocaml/opam.git'

  bottle do
    cellar :any
    sha1 "2da572e241fccfb61e4540ea0ac5deaa63c25743" => :mavericks
    sha1 "7905149b5ef0a6e294be6cc48d3f5d457974f7ef" => :mountain_lion
    sha1 "9cf7854f6a4eb86b92db5471f5a63d994f477efd" => :lion
  end

  depends_on "objective-caml"

  if MacOS.version >= :mountain_lion
    depends_on "aspcud" => :recommended

    if build.with? "aspcud"
      needs :cxx11
    end
  end

  def install
    ENV.deparallelize
    # Set TERM to workaround bug in ocp-build (ocaml/opam#1038)
    ENV["TERM"] = "dumb"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"

    bash_completion.install "shell/opam_completion.sh"
    zsh_completion.install "shell/opam_completion_zsh.sh"
  end

  test do
    system "#{bin}/opam", "--help"
  end

  def caveats; <<-EOS.undent
    OPAM uses ~/.opam by default for its package database, so you need to
    initialize it first by running (as a normal user):

    $  opam init

    Run the following to initialize your environment variables:

    $  eval `opam config env`

    To export the needed variables every time, add them to your dotfiles.
      * On Bash, add them to `~/.bash_profile`.
      * On Zsh, add them to `~/.zprofile` instead.

    Documentation and tutorials are available at http://opam.ocaml.org, or
    via 'man opam' and 'opam --help'.
    EOS
  end
end
