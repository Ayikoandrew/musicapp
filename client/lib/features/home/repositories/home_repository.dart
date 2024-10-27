import 'dart:convert';
import 'dart:io';

import 'package:client/core/constants/server_constants.dart';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/home/models/song_model.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository();
}

class HomeRepository {
  Future<Either<AppFailure, String>> uploadSong(
      {required File selectedAudio,
      required File selectedImage,
      required String songName,
      required String artists,
      required String hexCode,
      required String token}) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${ServerConstants.server}/song/upload'),
      );

      request
        ..files.addAll([
          await http.MultipartFile.fromPath(
            'song',
            selectedAudio.path,
          ),
          await http.MultipartFile.fromPath(
            'thumbnail',
            selectedImage.path,
          )
        ])
        ..fields.addAll(
          {
            'artist': artists,
            'song_name': songName,
            'hex_code': hexCode,
          },
        )
        ..headers.addAll(
          {
            'x-auth-token': token,
          },
        );

      final res = await request.send();
      if (res.statusCode == 200) {
        return Right('Upload successful');
      } else {
        return Left(AppFailure('Upload failed'));
      }
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}');
      return Left(AppFailure('Plugin not found'));
    } catch (e) {
      return Left(AppFailure('An unexpected error occurred'));
    }
  }

  Future<Either<AppFailure, List<SongModel>>> getAllSongs({
    required String token,
  }) async {
    try {
      final res = await http.get(
          Uri.parse('${ServerConstants.server}/song/list_songs'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': token,
          });

      var resBodyMap = jsonDecode(res.body);
      if (res.statusCode != 200) {
        resBodyMap = resBodyMap as Map<String, dynamic>;
        return Left(AppFailure(resBodyMap['detail']));
      }
      resBodyMap = resBodyMap as List;

      List<SongModel> songs = [];
      for (var map in resBodyMap) {
        songs.add(SongModel.fromMap(map));
      }
      return Right(songs);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
