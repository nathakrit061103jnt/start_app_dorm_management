import 'package:json_annotation/json_annotation.dart';


part 'new_post.g.dart';

@JsonSerializable()
class NewPost {
  NewPost({
this.newsId,
this.aid,
this.roomId,
this.newsDate,
this.newsTitle,
this.description,
});
      
  factory NewPost.fromJson(Map<String,dynamic> json) => _$NewPostFromJson(json);
  Map<String, dynamic> toJson() => _$NewPostToJson(this);
  @JsonKey(name: 'news_id') String? newsId;
  String? aid;
  @JsonKey(name: 'room_id') String? roomId;
  @JsonKey(name: 'news_date') String? newsDate;
  @JsonKey(name: 'news_title') String? newsTitle;
  String? description;
}
