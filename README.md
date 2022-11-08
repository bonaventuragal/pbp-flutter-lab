# Tugas 7 - counter_7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya
Stateless Widget adalah widget yang tidak bergantung pada sebuah state. Setelah di-build, perubahan pada sebuah state, variabel, atau data saat runtime tidak akan merubah stateless widget. Contoh stateless widget adalah `Icon` dan `Text`.

Stateful Widget adalah widget yang bergantung pada sebuah state. Setelah di-build, perubahan pada sebuah state, variabel, atau data yang terkait dengan widget tersebut saat runtime dapat merubah stateful widget. Contoh stateful widget adalah `Checkbox` dan `TextField`.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
- `Text`
Widget yang digunakan untuk menampilkan tulisan. Dalam tugas ini digunakan untuk menampilkan tulisan `GANJIL`, `GENAP`, dan `counter`.
- `Stack`
Widget yang digunakan untuk menampilkan child widget sebagai tumpukan, satu di atas yang lain. Dalam tugas ini digunakan untuk menampilkan 2 buah `FloatingActionButton`.
- `FloatingActionButton`
Widget berupa floating button. Dalam tugas ini terdapat 2 buah `FloatingActionButton`, masing-masing untuk menambahkan dan mengurangi `counter`.
- `Padding`
Widget yang digunakan untuk memberikan padding. Dalam tugas ini digunakan sebagai parent widget dari `FloatingActionButton` supaya terdapat jarak antara `FloatingActionButton` dan ujung layar

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut
`setState()` berfungsi untuk memberitahu Flutter framework bahwa terdapat state yang mengalami perubahan nilai. Akibatnya, method `build` akan di-run ulang dan menampilkan tampilan aplikasi yang sesuai dengan perubahan state tersebut. Jika sebuah state diubah tidak di dalam `setState()`, perubahan state tersebut tidak akan mengubah tampilan aplikasi dikarenakan method `build` tidak di-run ulang. Pada tugas ini, variabel yang terdampak oleh fungsi tersebut adalah variabel `_counter`.

## Jelaskan perbedaan antara `const` dengan `final`
`const` adalah modifier yang membuat sebuah **value** menjadi tetap dan tidak dapat diubah lagi. Nilai sebuah value yang memiliki modifier `const` harus diketahui ketika compile time. Statement `const arr = [1, 2];` berarti sebuah variabel `arr` memiliki value sebuah array konstan `[1, 2]`. Variabel dan array tersebut tidak dapat diubah lagi.

`final` adalah modifier yang membuat sebuah **variabel** menjadi tetap dan tidak dapat diubah lagi. Nilai sebuah variabel yang memiliki modifier `final` tidak harus diketahui ketika compile time. Statement `final arr = [1, 2];` berarti sebuah variabel `arr` memiliki value sebuah array. Isi array tersebut sendiri masih bisa diubah, statement seperti `arr[0] = 5;` dan `arr.add(3);` adalah statement yang valid.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
- Membuat program Flutter baru dengan menjalankan `flutter create counter_7`.
- Mengubah isi field `floatingActionButton` menjadi:
```
floatingActionButton: Stack(
  children: [
    if (_counter > 0)
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ),
      ),
    Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    ),
  ],
),
```

field `floatingActionButton` akan berisi sebuah `Stack`. `Stack` tersebut digunakan untuk menampilkan 2 buah `FloatingActionButton` satu di atas yang lain, dimana Button sebagai tombol decrement di-align ke bawah kiri dan Button sebagai tombol increment di-align ke bawah kanan. Kedua button tersebut ditaruh sebagai child dari sebuah `Padding` untuk memberikan jarak antara button dan ujung layar. [Referensi](https://stackoverflow.com/questions/50839282/how-to-add-multiple-floating-button-in-stack-widget-in-flutter)
- Tulisan di atas tombol counter diubah dengan menambahkan 2 buah `Text` untuk menampilkan tulisan `GANJIL` berwarna merah dan `GENAP` berwarna biru. Kedua `Text` tersebut dimasukkan ke dalam sebuah conditional, sehingga hanya salah satu dari kedua `Text` tersebut yang ditampilkan, sesuai dengan state `_counter`.
- Menambahkan function `_incrementCounter()` dan `_decrementCounter()` yang masing-masing di dalamnya memanggil `setState()`. Di dalam `setState()` tersebut, `_counter` akan ditambah/dikurang 1. `_counter` hanya akan dikurang 1 jika `_counter > 0`.
- Kedua `FloatingActionButton` yang telah ditambahkan sebelumnya disambungkan dengan function yang bersesuaian dengan cara menambahkan function tersebut pada properti `onPressed`.