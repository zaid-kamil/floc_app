import 'package:floc_app/data/floc_image_model.dart';


// Data source is responsible for fetching data from the network or local storage
// is should be injected into the repository
// in real-world apps, this class would make an API call to fetch data
// Data source => `data` folder
class FlocDataSource {
  /// Returns a list of `FImage`
  Future<List<FImage>> getImages() {
    // get images with a fake delay
    return Future.delayed(Duration(milliseconds: 0), () {
      return List<FImage>.generate(
        175, // total # of images
        (i) => FImage(
          path: 'assets/images/img_${i + 1}.png', // image path
          name: 'Image ${i + 1}', // image name
          category: 'Category ${i % 5}', // image category
        ),
      );
    });
  }
}
