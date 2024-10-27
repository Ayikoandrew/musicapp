// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class SongModel {
  final String id;
  final String song_url;
  final String thumbnail_url;
  final String artist;
  final String song_name;
  final String hex_code;
  SongModel({
    required this.id,
    required this.song_url,
    required this.thumbnail_url,
    required this.artist,
    required this.song_name,
    required this.hex_code,
  });

  SongModel copyWith({
    String? id,
    String? song_url,
    String? thumbnail_url,
    String? artist,
    String? song_name,
    String? hex_code,
  }) {
    return SongModel(
      id: id ?? this.id,
      song_url: song_url ?? this.song_url,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
      artist: artist ?? this.artist,
      song_name: song_name ?? this.song_name,
      hex_code: hex_code ?? this.hex_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'song_url': song_url,
      'thumbnail_url': thumbnail_url,
      'artist': artist,
      'song_name': song_name,
      'hex_code': hex_code,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] ?? '',
      song_url: map['song_url'] ?? '',
      thumbnail_url: map['thumbnail_url'] ?? '',
      artist: map['artist'] ?? '',
      song_name: map['song_name'] ?? '',
      hex_code: map['hex_code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongModel(id: $id, song_url: $song_url, thumbnail_url: $thumbnail_url, artist: $artist, song_name: $song_name, hex_code: $hex_code)';
  }

  @override
  bool operator ==(covariant SongModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.song_url == song_url &&
        other.thumbnail_url == thumbnail_url &&
        other.artist == artist &&
        other.song_name == song_name &&
        other.hex_code == hex_code;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        song_url.hashCode ^
        thumbnail_url.hashCode ^
        artist.hashCode ^
        song_name.hashCode ^
        hex_code.hashCode;
  }
}
