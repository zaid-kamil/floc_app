import 'package:floc_app/data/floc_data_source.dart';
import 'package:floc_app/data/floc_image_model.dart';
import 'package:floc_app/domain/floc_repository.dart';
import 'package:flutter/foundation.dart';

// this is the repository implementation
// the benefit of using a repository is that it provides a
// clear separation between the data source and the rest of the app
// it should be used to fetch data from the data source
// Repository implementation => `data` folder
class FlocRepoImpl implements FlocRepository {
  final flocDataSource = FlocDataSource();

  @override
  Future<List<FImage>> getImagesByName(String name) {
    return flocDataSource.getImages().then((images) {
      return images.where((element) => element.name.contains(name)).toList();
    });
  }

  @override
  Future<List<FImage>> getImages() {
    return flocDataSource.getImages();
  }

  @override
  Future<List<FImage>> getImagesByCategory(String category) {
    return flocDataSource.getImages().then((images) {
      return images.where((element) => element.category == category).toList();
    });
  }



  @override
  Future<List<String>> getCategories() {
    return flocDataSource.getImages().then((images) {
      debugPrint('categories: ${images.map((img) => img.category).toSet().toList()}');
      return images.map((img) => img.category).toSet().toList();
    });
  }

  @override
  Future<List<FImage>> getImagesById(int id) {
    return flocDataSource.getImages().then((images) {
      return images.where((element) => element.path.contains('img_$id')).toList();
    });
  }
}
