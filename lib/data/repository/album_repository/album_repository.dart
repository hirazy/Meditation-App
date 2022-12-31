import '../repository.dart';

class AlbumRepository extends Repository {
  AlbumRepository(super.read);

  Future<void> handleMediaAction() async {
    audioServiceImpl.handleMediaAction();
  }
}
