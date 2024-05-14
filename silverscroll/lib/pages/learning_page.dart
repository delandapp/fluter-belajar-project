import 'package:flutter/material.dart';
import 'package:silverscroll/data/class/academy.dart';

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}

class LearningPathList extends StatelessWidget {
  // !Di dalam LearningPathList tambahkan fungsi yang akan mengembalikan widget SliverPersistentHeader.
  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      //* Parameter delegate harus diisi dengan kelas SliverPersistentHeaderDelegate. Karena kelas ini merupakan abstract class, maka kita perlu membuat kelas implementasinya terlebih dulu.
      delegate: SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 150,
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(
        academy.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }

  const LearningPathList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //! Di sini kita akan menggunakan widget CustomScrollView. Widget ini adalah widget ScrollView yang membuat efek custom scroll dengan Slivers. Widget ini memiliki parameter slivers yang mirip dengan children. Isi parameter tersebut dengan widget sliver yang ingin ditampilkan.
      //? Parameter slivers hanya boleh diisi dengan widget sliver. Karena itulah kita akan gunakan widget SliverListuntuk menampilkan list.

      slivers: [
        _header('Android Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            androidPaths.map(_buildTile).toList(),
          ),
        ),
        _header('iOS Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            iosPaths.map(_buildTile).toList(),
          ),
        ),
        _header('Multi-Platform App Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: flutterPaths.map(_buildTile).toList(),
        ),
        _header('Front-End Web Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: webPaths.map(_buildTile).toList(),
        )
      ],
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
