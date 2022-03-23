// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPost _$NewPostFromJson(Map<String, dynamic> json) {
  return NewPost(
    newsId: json['news_id'] as String?,
    aid: json['aid'] as String?,
    roomId: json['room_id'] as String?,
    newsDate: json['news_date'] as String?,
    newsTitle: json['news_title'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$NewPostToJson(NewPost instance) => <String, dynamic>{
      'news_id': instance.newsId,
      'aid': instance.aid,
      'room_id': instance.roomId,
      'news_date': instance.newsDate,
      'news_title': instance.newsTitle,
      'description': instance.description,
    };
