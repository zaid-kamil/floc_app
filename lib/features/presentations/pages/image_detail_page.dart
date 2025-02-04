import 'package:floc_app/data/floc_image_model.dart';
import 'package:floc_app/features/presentations/blocs/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailPage extends StatelessWidget {
  final FImage image;

  const ImageDetailPage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          // close
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: _buildImageDetail(context, image),
    );
  }

  Widget _buildImageDetail(BuildContext context, FImage image) {
    return Hero(
      tag: image.path,
      child: Center(
        child: Image.asset(
          image.path,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return WillPopScope(
//     onWillPop: () {
//       BlocProvider.of<ImageBloc>(context).add(ClearImage());
//       return Future.value(true);
//     },
//     child: Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           // close
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () {
//               BlocProvider.of<ImageBloc>(context).add(ClearImage());
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       body: BlocConsumer<ImageBloc, ImageState>(
//         listener: (context, state) {
//           if (state is ImageError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.message),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is ImageLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is ImageError) {
//             return Center(child: Text(state.message));
//           } else if (state is ImageDetail) {
//             return _buildImageDetail(context, state.image);
//           } else {
//             return const Center(child: Text('No image selected'));
//           }
//         },
//       ),
//     ),
//   );
// }
//
// Widget _buildImageDetail(BuildContext context, FImage image) {
//   return Hero(
//     tag: image.path,
//     child: Center(
//       child: Image.asset(
//         image.path,
//         fit: BoxFit.contain,
//       ),
//     ),
//   );
// }
}
