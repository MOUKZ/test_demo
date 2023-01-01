import 'package:task_demo/domain/entities/rating.dart';

class RatingsRawResponse {
  String? source;
  String? value;

  RatingsRawResponse({this.source, this.value});

  RatingsRawResponse.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }

  Ratings toEntity() => Ratings(
        source: source,
        value: value,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Source'] = source;
    data['Value'] = value;
    return data;
  }
}
