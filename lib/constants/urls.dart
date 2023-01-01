class Urls {
  static const String baseUrl = 'https://www.omdbapi.com';
  //TODO remove api key to .env
  // static const String apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const String apiKey = 'apikey=21af3ff2';

  /// Movies
  static String searchMovies(String query, String page, String year) {
    final url = year.isEmpty
        ? '$baseUrl/?$apiKey&s=$query&page=$page'
        : '$baseUrl/?$apiKey&s=$query&y=$year&page=$page';
    return url;
  }

  static String movieDetails(String id) => '$baseUrl/?$apiKey&i=$id&plot=full';
}
