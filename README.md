# Perl Dizin Kontrol Uygulaması
Bu proje, bir URL'ye giderek belirli dizinlerin var olup olmadığını kontrol eden bir Perl uygulamasıdır. Kullanıcı, bir URL girdisi sağlar ve uygulama, dizin.txt dosyasındaki dizinleri kontrol ederek, bulunan dizinleri .txt dosyasına kaydeder. Ayrıca uygulama renkli çıktılar verir ve ASCII sanatını kullanarak Türk hacktivist kökenli bir imza içerir.

# Özellikler
Verilen URL'de dizinlerin varlığını kontrol eder.
Bulunan dizinleri .txt dosyasına kaydeder.
Konsolda renkli çıktı sağlar.
CPU ve RAM kullanımı optimize edilmiştir, her sorgu arasında gecikme eklenmiştir.

# Gerekli Kütüphaneler
Uygulamanın düzgün çalışması için Perl'de aşağıdaki kütüphanelerin yüklü olması gerekir:

LWP::UserAgent: HTTP isteklerini yönetmek için kullanılır.
Term::ANSIColor: Konsolda renkli çıktılar almak için kullanılır.
Time::HiRes: CPU ve RAM kullanımını optimize etmek için kullanılan mikro saniyelik gecikmeler sağlar.

