- Terdapat 2 modul CI yang di terapkan dalam finitive.pro
	1. untuk CI admin 
	2. CI web untuk pengunjung web


- Semua dokumentasi,cara kerja, dan database bisa di lihat di folder deliverable

- folder public untuk menyimpan file atau gambar secara public

- install tortoise git atau aplikasi lain untuk clone di github, commit, push, dan pull sehingga lebih efisien


+++++++++ Tata cara penulisan koding ++++++++++++++++

- Pembuatan model harus berdasarkan tabel didatabase,contoh ada tabel user maka bisa dibuat model user di CI nya

- dilarang membuat model yang ambigu semisal query untuk tabel user harus dimasukkan semua nya didalam model user 
sehingga bila controller ingin mekakses model hanya tinggal "$this->load->model"

- setiap function harus diberikan keterangan untuk mempermudah debuging dan maintenance

- penulisan function di samakan dengan baris tab 4x

- penulisan nama function memakai kaidah yang sama didalam 
bahasa java seperti function loginUsername (suku kata pertama diawali huruf kecil dan sukukata kedua diawali huruf besar)


++++++++++ bagian Desain ++++++++++++++

- ukuran 1 layar penuh adalah 1360x768

- bila desain sudah jadi copas di dropbox taruh file didalam finitiv.pro/public/img

