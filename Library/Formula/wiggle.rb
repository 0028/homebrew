require 'formula'

class Wiggle < Formula
  homepage 'http://neil.brown.name/blog/20100324064620'
  url 'http://neil.brown.name/wiggle/wiggle-0.9.tar.gz'
  sha1 '9091671b939559025d217b8830eaab4b313f6b44'

  bottle do
    cellar :any
    sha1 "b047e1f03d23a1a08fb548f12d023415d7568c3b" => :mavericks
    sha1 "5fb7fb70acd22616f2be71f5f61e4121a0069be3" => :mountain_lion
    sha1 "dca002f1f6f6d6bb895c4b9410b141dd0b74c733" => :lion
  end

  # Patches 1,2,4 are fixes for OSX in response to a report for Homebrew.
  # Patches 3 & 5 are unrelated but were added the day after 0.9 was released.
  # As all 5 patches are in HEAD, remove them after version 0.9.
  def patches
    [
      'http://neil.brown.name/git?p=wiggle.git;a=patch;h=b5281154078e768c43bf75d70df66c61542c580a',
      'http://neil.brown.name/git?p=wiggle.git;a=patch;h=9c7b89a7b7bfa33ec24c04dfebceba1a464cbf1b',
      'http://neil.brown.name/git?p=wiggle.git;a=patch;h=0da9cb2c412ad27802788bdb5e23854f2478dbe6',
      'http://neil.brown.name/git?p=wiggle.git;a=patch;h=5eb651029aed24bbe4e093ffb11b6a70c02b44e2',
      'http://neil.brown.name/git?p=wiggle.git;a=patch;h=22612c04075b1bce61922e396cca4641760f226b'
    ]
  end

  def install
    # Adjust debug flags according to INSTALL doc
    inreplace 'Makefile', 'OptDbg=-ggdb', "OptDbg=-g #{ENV.cflags}"

    # Avoid broken install that uses an unrecognized flag, '-D'.  Let it run
    # the tests because we are trusting it to patch files correctly (~2sec).
    system "make wiggle wiggle.man test"
    # Manual install into Homebrew prefix
    bin.install "wiggle"
    man1.install "wiggle.1"
  end
end
