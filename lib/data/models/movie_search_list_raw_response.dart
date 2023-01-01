import 'package:equatable/equatable.dart';
import 'package:task_demo/data/models/movie_search_raw_item_response.dart';

class MovieSearchListRawResponse extends Equatable {
  final List<MovieSearchRawItemResponse>? movieList;
  final bool? response;
  final String? error;

  const MovieSearchListRawResponse({this.movieList, this.error, this.response});

  factory MovieSearchListRawResponse.fromJson(Map<String, dynamic> json) =>
      MovieSearchListRawResponse(
          movieList: json['Search'] == null
              ? null
              : List<MovieSearchRawItemResponse>.from(
                  (json['Search'] as List)
                      .map((x) => MovieSearchRawItemResponse.fromJson(x)),
                ),
          response: json['Response'] == 'True',
          error: json['Error']);

  Map<String, dynamic> toJson() => {
        'Search': List<dynamic>.from(movieList?.map((x) => x.toJson()) ?? []),
        'Error': error,
        'Response': response
      };

  @override
  List<Object> get props => [movieList ?? [], error ?? '', response!];
}
