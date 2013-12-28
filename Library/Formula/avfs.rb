require 'formula'

class Avfs < Formula
  homepage 'http://avf.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/avf/avfs/1.0.1/avfs-1.0.1.tar.gz'
  sha1 '77ce08fb10c680e6d5821ea8634d06a351b747f2'

  bottle do
    sha1 '399ae4aa8799f0c54dc3604aaf8e70e083cf5352' => :mavericks
    sha1 '60adb96c340b4975525bd8e620e794acffe1a588' => :mountain_lion
    sha1 '86a8f3a3117f8ee19559219a695ede938f97960d' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def patches
    # Fix scripts to work on Mac OS X.
    DATA
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-fuse",
                          "--enable-library",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "avfsd", "--version"
  end
end

__END__
diff --git i/scripts/mountavfs w/scripts/mountavfs
index 5722dcd..a35e633 100755
--- i/scripts/mountavfs
+++ w/scripts/mountavfs
@@ -14,7 +14,7 @@ else
     MntDir=${HOME}/.avfs
 fi

-grep -qE "avfsd ${MntDir}" /proc/mounts || {
+grep -qE "avfsd.*${MntDir}" < <(mount) || {
    if [ ! -e "$MntDir" ]; then
       mkdir -p "$MntDir"
    fi
diff --git i/scripts/umountavfs w/scripts/umountavfs
index 09dc629..a242c21 100644
--- i/scripts/umountavfs
+++ w/scripts/umountavfs
@@ -14,11 +14,11 @@ else
     MntDir="${HOME}/.avfs"
 fi

-grep -qE "${MntDir}.*avfsd" /proc/mounts && {
+grep -qE "avfsd.*${MntDir}" < <(mount) && {
    echo unMounting AVFS on $MntDir...
    if type -p fusermount > /dev/null 2>&1 ; then
       fusermount -u -z "$MntDir"
    else
-      umount -l "$MntDir"
+      umount "$MntDir"
    fi
 }
