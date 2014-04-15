require 'formula'

class Aldo < Formula
  homepage 'http://www.nongnu.org/aldo/'
  url 'http://savannah.nongnu.org/download/aldo/aldo-0.7.7.tar.bz2'
  sha1 'c37589f8cb0855d33814b7462b3e5ded21caa8ea'

  bottle do
    cellar :any
    sha1 "e2ca3e89556ec592e119e442e7e612ca7699fc3e" => :mavericks
    sha1 "fb8cef297d5281c3c20340d06d7e03326a29e876" => :mountain_lion
    sha1 "17793ee003afb8dbb4a67ea13bc231997c8ef18c" => :lion
  end

  depends_on 'libao'

  patch :DATA

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

__END__
diff --git a/src/menu.cc b/src/menu.cc
index 483b826..092d604 100644
--- a/src/menu.cc
+++ b/src/menu.cc
@@ -112,20 +112,17 @@ void Menu::add_item(id_type id, std::string c, Function2 f)
 
 void Menu::add_item_at(unsigned int pos, id_type id, std::string c, Function1 f)
 {
-    IT it(&m_its[pos]);
-    m_its.insert(it, Item(id,c,f) );
+    m_its.insert(m_its.begin()+pos, Item(id,c,f) );
 }
 
 void Menu::add_item_at(unsigned int pos, id_type id, std::string c, Function2 f)
 {
-    IT it(&m_its[pos]);
-    m_its.insert(it, Item(id,c,f) );
+    m_its.insert(m_its.begin()+pos, Item(id,c,f) );
 }
 
 void Menu::delete_item_at(unsigned int pos)
 {
-    IT it(&m_its[pos]);
-    m_its.erase(it);
+    m_its.erase(m_its.begin()+pos);
 }
