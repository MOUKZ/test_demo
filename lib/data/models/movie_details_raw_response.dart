import 'package:task_demo/data/models/ratings_raw_responce.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/entities/rating.dart';

class MovieDetailsRawResponse {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<RatingsRawResponse>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dVD;
  String? boxOffice;
  String? production;
  String? website;
  bool? response;
  String? error;

  MovieDetailsRawResponse({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dVD,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
    this.error,
  });

  MovieDetailsRawResponse.fromJson(Map<String, dynamic> json) {
    response = json['Response'] == 'True';
    error = json['Error'];
    if (response!) {
      title = json['Title'];
      year = json['Year'];
      rated = json['Rated'];
      released = json['Released'];
      runtime = json['Runtime'];
      genre = json['Genre'];
      director = json['Director'];
      writer = json['Writer'];
      actors = json['Actors'];
      plot = json['Plot'];
      language = json['Language'];
      country = json['Country'];
      awards = json['Awards'];
      poster = json['Poster'];
      if (json['Ratings'] != null) {
        ratings = <RatingsRawResponse>[];
        json['Ratings'].forEach((v) {
          ratings!.add(RatingsRawResponse.fromJson(v));
        });
      }
      metascore = json['Metascore'];
      imdbRating = json['imdbRating'];
      imdbVotes = json['imdbVotes'];
      imdbID = json['imdbID'];
      type = json['Type'];
      dVD = json['DVD'];
      boxOffice = json['BoxOffice'];
      production = json['Production'];
      website = json['Website'];
    }
  }

  Movie toEntity() {
    final List<Ratings>? ratingsList =
        ratings?.map((e) => e.toEntity()).toList();

    return Movie(
      title: title,
      year: year,
      rated: rated,
      released: released,
      runtime: runtime,
      genre: genre,
      director: director,
      writer: writer,
      actors: actors,
      plot: plot,
      language: language,
      country: country,
      awards: awards,
      poster: poster,
      ratings: ratingsList,
      metascore: metascore,
      imdbRating: imdbRating,
      imdbVotes: imdbVotes,
      imdbID: imdbID,
      type: type,
      dVD: dVD,
      boxOffice: boxOffice,
      production: production,
      website: website,
      response: response,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Country'] = country;
    data['Awards'] = awards;
    data['Poster'] = poster;
    if (ratings != null) {
      data['Ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['Metascore'] = metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['DVD'] = dVD;
    data['BoxOffice'] = boxOffice;
    data['Production'] = production;
    data['Website'] = website;
    data['Response'] = response;
    return data;
  }
}
