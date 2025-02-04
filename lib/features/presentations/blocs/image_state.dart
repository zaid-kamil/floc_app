part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<FImage> images;
  final List<String> categories;
  ImageLoaded(this.images, this.categories);
}

class ImageError extends ImageState {
  final String message;
  ImageError(this.message);
}

class ImageDetail extends ImageState {
  final FImage image;
  ImageDetail(this.image);
}

class ImageFiltered extends ImageState {
  final List<FImage> images;
  final List<String> categories;
  ImageFiltered(this.images, this.categories);
}
