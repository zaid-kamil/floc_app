import 'package:floc_app/data/floc_data_source.dart';
import 'package:floc_app/data/floc_image_model.dart';

// this is the repository interface
// the benefit of using a abstract repository is that it provides a
// clear picture of what the repository should do and what methods it should have
// Keep in mind:
// Repository interface => `domain` folder
// Repository implementation => `data` folder

abstract class FlocRepository {
  // all images
  Future<List<FImage>> getImages();

  // get images by category
  Future<List<FImage>> getImagesByCategory(String category);

  // get image by name
  Future<List<FImage>> getImagesByName(String name);

  // get image by id
  Future<List<FImage>> getImagesById(int id);

  // get categories
  Future<List<String>> getCategories();
}
