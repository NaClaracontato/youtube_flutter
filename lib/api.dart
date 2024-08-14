// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyC84rrrVY8kEWvCAXLNuFIi9x6sgxLs91M";
const ID_CANAL = "UCiFg-2CjsG_xcSsHNjDeLpw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      Uri.parse(
        URL_BASE +
            'search'
                '?part=snippet'
                '&type=video'
                "&maxResults=20"
                '&order=date'
                '&key=$CHAVE_YOUTUBE_API'
                '&channelId=$ID_CANAL'
                '&q=$pesquisa',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = (dadosJson['items'] as List).map((item) {
        return Video.fromJson(item);
      }).toList();

      return videos;
    } else {
      throw Exception('Falha ao carregar os videos :()');
    }
  }
}
