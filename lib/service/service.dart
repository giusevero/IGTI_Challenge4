import 'dart:convert';

import 'package:igti_challenge/models/album.dart';
import 'package:http/http.dart' as http;
import 'package:igti_challenge/models/photo.dart';

class Service {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Album>> getAlbums() async {
    var response = await http.get('$baseUrl/users/1/albums');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var albums = objs.map((e) => Album.fromJson(e)).toList();
      return albums;
    } else {
      throw Exception('Erro ao carregar álbuns');
    }
  }

  Future<List<Photo>> getPhotos(albumId) async {
    var response = await http.get('$baseUrl/albums/$albumId/photos');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var photos = objs.map((e) => Photo.fromJson(e)).toList();
      return photos;
    } else {
      throw Exception('Erro ao carregar fotos');
    }
  }
}
