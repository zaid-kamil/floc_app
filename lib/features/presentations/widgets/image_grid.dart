import 'package:floc_app/data/floc_image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floc_app/features/presentations/blocs/image_bloc.dart';
import 'package:floc_app/features/presentations/pages/image_detail_page.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        debugPrint('ImageGrid: state: $state');
        switch (state) {
          case ImageLoading():
            return const Center(child: CircularProgressIndicator());
          case ImageLoaded():
            return _buildGrid(context, state.images);
          case ImageError():
            return Center(child: Text(state.message));
          default:
            return const Center(child: Text('No images found'));
        }
      },
    );
  }

  Widget _buildGrid(BuildContext context, List<FImage> images) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.black12,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailPage(image: image),
                  ),
                );
              },
              child: Hero(
                tag: image.path,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image.path,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
