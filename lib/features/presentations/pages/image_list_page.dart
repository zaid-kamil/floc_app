import 'package:floc_app/features/presentations/widgets/category_chips.dart';
import 'package:floc_app/features/presentations/widgets/image_grid.dart';
import 'package:floc_app/features/presentations/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ImageListPage extends StatelessWidget {
  const ImageListPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Floc App'),
        centerTitle: true,
        actions: [
          const FlocSearchBar(),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          const CategoryChips(),
          Expanded(child: const ImageGrid()),
        ],
      ),

    );
  }
}
