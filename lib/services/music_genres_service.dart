import 'package:http/http.dart' as http;
import '../data_models/music_genres_model.dart';

Future<String> fetchMusicGenre() async {
  final uri = Uri.parse('https://binaryjazz.us/wp-json/genrenator/v1/story/');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Music API ${resp.statusCode}');
  }
  return musicGenresFromJson(resp.body);
}