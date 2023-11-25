import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:untitled1/data/Api/api.dart';
import 'package:untitled1/data/models/mars_photo.dart';
import 'package:untitled1/utils/hive_managment.dart';

class Repo {
  late API _api;

  Repo() {
    _api = API();
  }

  Future<List<MarsPhoto>> fetchPhotos(DateTime earthDate) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      List<dynamic> jsonList = await _api.fetchPhotos(earthDate.toString());
      final photosList = jsonList.map((e) => MarsPhoto.fromJson(e)).toList();
      HiveManagment.storeMarsPhotos(photosList);
      return photosList;
    } else {
      return HiveManagment.getEarthDatePhotos(earthDate);
    }
  }
}