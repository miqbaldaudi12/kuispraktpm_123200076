import 'package:praktpm_quiz/disease_data.dart';

class Favorite {
  final Diseases? diseases;
  final bool? isFavorite;
  Favorite({this.diseases, this.isFavorite});
  var favoriteList = <Favorite>[];
}