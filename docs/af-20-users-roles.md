# af-07-users-roles.md

`Selasa, 23 Juli 2019`

**`10:47`**

# Specification Requests

Aplikasi memiliki layanan pengaturan otoritas pemanfaatan fitur-fitur aplikasi sesuai dengan peran pengguna di dalam aplikasi

# Features

0. Development Administrator dapat menetapkan nama User's Role (Kelas Pengguna)
1. Development dan Application Administrator dapat melakukan perubahan ketetapan (CRUD Operation) terhadap data User's Role agar sesuai dengan kebutuhan faktual
2. Development Administrator dapat menetapkan nama User's Duties (Tugas Pengguna)
3. Development dan Application Administrator dapat melakukan perubahan ketetapan (CRUD Operation) terhadap data User's Duties agar sesuai dengan kebutuhan faktual
4. Development Administrator dapat menetapkan nama User's Duty Items (Item Tugas Pengguna)
5. Development dan Application Administrator dapat melakukan perubahan ketetapan (CRUD Operation) terhadap data User's Duty Items agar sesuai dengan kebutuhan faktual
6. Development dan Application Administrator dapat menetapkan data Users dan otoritasnya
7. Development dan Application Administrator dapat melakukan perubahan ketetapan (CRUD Operation) terhadap data Users agar sesuai dengan kebutuhan faktual

# Scheme Relation Diagram



`frontend` menghendaki authentikasi berbasis peran. `frontend` harus dapat memperoleh informasi:

"Peran seorang user di organisasi dan fitur apa saja yang dapat diaksesnya."

Seorang user harus 'mendapatkan' sajian semua features yang sesuai dengan perannya dan ditata berdasarkan kelompok dan item-item features. Access-control semacam ini disebut sebagai RBAC atau Role Based Access Control.

Implementasi RBAC di real-world bisa sangat bervariasi. Tergantung dari subyek implementasi. Di OS, biasa diimplementasikan untuk hak access atau permission atas sebuah direktori dan file. Di database biasa diimplementasikan untuk hak operasi CRUD atas obyek data. Di aplikasi biasa diimplementasikan untuk hak access fitur.






