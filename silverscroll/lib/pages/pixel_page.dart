import 'package:flutter/material.dart';
import 'package:silverscroll/data/constans/string.dart';

class PixelPage extends StatelessWidget {
  const PixelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://i.pinimg.com/236x/14/ad/31/14ad3171038b99261210a9fbe6785d41.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  title: const Text('Google Pixel'),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'$735',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                color: Colors.black26,
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.collections,
                      color: Colors.white,
                    ),
                    Text(
                      '6 photos',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Stock hanya 5 buah',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          const Text(contentText),
          const SizedBox(height: 8),
          Text(
            'Spesifikasi',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Table(
            columnWidths: const {1: FractionColumnWidth(0.7)},
            children: const [
              TableRow(
                children: [
                  Text('Display'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsDisplay),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Size'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsSize),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Battery'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsBattery),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Dijual oleh',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/photo_2.jpg'),
                  radius: 24,
                ),
              ),
              Text('Narenda Wicaksono'),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to Cart'),
                  ),
                );
              },
              child: const Text('Beli'),
            ),
          )
        ],
      ),
    ),
  ),),
    );
  }
}

// Sekarang ingat bahwa Slivers adalah sebagian area yang dapat di-scroll. Dalam hal ini ada dua bagian yang bisa di-scroll, yaitu AppBar dan konten utamanya. Kali ini kita menggunakan widget NestedScrollView untuk memasukkan widget scrolling ke dalam widget scrolling lain. Widget ini akan memberikan efek collapsingpada AppBar.

// ! Bagaimana agar AppBar tetap tampil seperti tampilan default-nya. Anda dapat menambahkan parameter pinned yang bernilai true.
// ? Susunan widget di atas tidak jauh berbeda dengan susunan widget pada umumnya. Namun, kita akan membahas widget yang baru pertama kita gunakan, yaitu Table. Sesuai namanya, widget ini digunakan untuk menyusun widget lain sebagai tabel. Anda mendefinisikan baris tabel dengan widget TableRow lalu children-nya sebagai kolom.
// * Parameter columnWidths digunakan untuk menentukan lebar kolom dari tabel.