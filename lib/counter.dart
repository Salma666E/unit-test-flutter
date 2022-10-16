import 'dart:convert';

import 'package:http/http.dart' as http;

//'{"userId": 1, "id": 2, "title": "mock"}'
class Album {
  
  int userId;
  int id;
  String title;
  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

//fetchAlbum
Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

//Counter
class Counter {
  int value = 0;
  void increment() => value++;
  void decrement() => value--;
}
