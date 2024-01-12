import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/apiModal/album.dart';
import 'package:to_do_list/apiModal/modal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<SamplePost> samplePosts = [];
  // late Future<Album> futureAlbum;
  // Future<Album> fetchAlbum() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<List<SamplePost>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePost.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: samplePosts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Color.fromARGB(255, 204, 125, 233),
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UserId : ${samplePosts[index].userId}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Id : ${samplePosts[index].id}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Title : ${samplePosts[index].title}',
                                maxLines: 1,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Body : ${samplePosts[index].body}',
                                maxLines: 1,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // By default, show a loading spinner.
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
