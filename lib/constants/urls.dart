import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const String baseUrl = 'https://www.omdbapi.com';

  static String searchMovies(String query, String page, String year) {
    final apikey = 'apikey=${dotenv.env['APIKEY']}';
    final url = year.isEmpty
        ? '$baseUrl/?$apikey&s=$query&page=$page'
        : '$baseUrl/?$apikey&s=$query&y=$year&page=$page';
    return url;
  }

  static String movieDetails(String id) {
    final apikey = 'apikey=${dotenv.env['APIKEY']}';
    return '$baseUrl/?$apikey&i=$id&plot=full';
  }
}
