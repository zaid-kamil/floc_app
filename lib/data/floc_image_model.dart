// Model for Floc Image
// This class represents an image in the Floc app
// it should be used to pass image data between the data source and the repository
// the benefit of using a model class is that it provides a clear structure for the data
// its kept inside the folder `data` because it's a data model
// Model => `data` folder
class FImage {
  final String path;
  final String name;
  final String category;
  FImage({required this.path, required this.name, this.category = 'All'});

  @override
  String toString() {
    return 'FImage{path: $path, name: $name}';
  }
}
