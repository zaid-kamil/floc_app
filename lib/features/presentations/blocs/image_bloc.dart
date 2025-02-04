import 'package:floc_app/data/floc_image_model.dart';
import 'package:floc_app/domain/floc_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final FlocRepository repository;

  ImageBloc(this.repository) : super(ImageInitial()) {
    on<LoadImages>(_onLoadImages);
    on<SearchImages>(_onSearchImages);
    on<FilterImagesByCategory>(_onFilterImagesByCategory);
    on<SelectImage>(_onImageSelected);
    on<ClearImage>((event, emit) {
      add(LoadImages());
    });
    on<ClearSearch>((event, emit) {
      add(LoadImages());
    });
  }

  void _onLoadImages(LoadImages event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    debugPrint('loading images');
    try {
      final images = await repository.getImages();
      final categories = await repository.getCategories();
      debugPrint('categories: $categories');
      emit(ImageLoaded(images, categories));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }

  void _onSearchImages(SearchImages event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    try {
      debugPrint('bloc for ${event.query}');
      if (event.query.contains(RegExp(r'[0-9]'))) {
        debugPrint('searching by id');
        final images = await repository.getImagesById(int.parse(event.query));
        final categories = await repository.getCategories();
        emit(ImageLoaded(images, categories));
        return;
      } else {
        debugPrint('searching by name ${event.query}');
        final images = await repository.getImagesByName(event.query);
        final categories = await repository.getCategories();
        emit(ImageLoaded(images, categories));
        return;
      }
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }

  void _onFilterImagesByCategory(
      FilterImagesByCategory event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    try {
      final images = await repository.getImagesByCategory(event.category);
      final categories = await repository.getCategories();
      emit(ImageLoaded(images, categories));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }

  void _onImageSelected(SelectImage event, Emitter<ImageState> emit) {
    emit(ImageLoading());
    try {
      emit(ImageDetail(event.image));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }
}
