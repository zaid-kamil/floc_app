part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class LoadImages extends ImageEvent {}

class SearchImages extends ImageEvent {
  final String query;
  SearchImages(this.query) {
    debugPrint('Searching for $query');
  }
}

class FilterImagesByCategory extends ImageEvent {
  final String category;

  FilterImagesByCategory(this.category);
}

class SelectImage extends ImageEvent {
  final FImage image;

  SelectImage(this.image);
}

class ClearImage extends ImageEvent {}

class ClearSearch extends ImageEvent {}
