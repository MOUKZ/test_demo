import 'package:task_demo/domain/entities/movie.dart';

class MovieSearchRawItemResponse {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  MovieSearchRawItemResponse(
      {this.title, this.year, this.imdbID, this.type, this.poster});

  MovieSearchRawItemResponse.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }
  Movie toEntity() => Movie(
        title: title,
        year: year,
        imdbID: imdbID,
        type: type,
        poster: poster,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['Poster'] = poster;
    return data;
  }
}
