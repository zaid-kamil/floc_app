import 'package:floc_app/features/presentations/blocs/image_bloc.dart';
import 'package:floc_app/features/presentations/pages/image_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlocSearchBar extends StatelessWidget {
  const FlocSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      icon: const Icon(Icons.search),
      onPressed: () {
        showSearch(context: context, delegate: ImageSearchDelegate());
      },
    );
  }
}

class ImageSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        context.read<ImageBloc>().add(ClearSearch());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<ImageBloc>().add(SearchImages(query));
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state is ImageLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ImageLoaded) {
          debugPrint(
              'ImageSearchDelegate: state: $state, ${state.images.length}');
          return _buildList(context, state);
        } else if (state is ImageError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No images found'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search for images'));
  }

  Widget _buildList(BuildContext context, ImageLoaded state) {
    return ListView.builder(
      itemCount: state.images.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(state.images[index].name),
          subtitle: Text(state.images[index].category),
          leading: Image.asset(
            state.images[index].path,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ImageDetailPage(image: state.images[index]),
              ),
            );
          },
        );
      },
    );
  }
}
