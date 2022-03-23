import 'dart:async';
import 'dart:convert';

import 'package:dormitory_app/models/index.dart';
import 'package:dormitory_app/src/constants/api.dart';
import 'package:dormitory_app/src/screens/new_post/widget/new_post_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<NewPost>> fetchNewPosts(http.Client client) async {
  final urlApi = '${API.NEW_POST_API}';
  final response = await client.get(Uri.parse(urlApi));

  return compute(parseNewPosts, response.body);
}

List<NewPost> parseNewPosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NewPost>((json) => NewPost.fromJson(json)).toList();
}

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'กระดานข่าว';

    return const MaterialApp(
      title: appTitle,
      home: HomePage(title: appTitle),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: FutureBuilder<List<NewPost>>(
            future: fetchNewPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                return NewPostsList(newPosts: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class NewPostsList extends StatelessWidget {
  const NewPostsList({Key? key, required this.newPosts}) : super(key: key);

  final List<NewPost> newPosts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newPosts.length,
      itemBuilder: (context, index) {
        // return  Text(newPosts[index].newsTitle.toString());
        // final String newsIdParam =  newPosts[index].newsId.toString() ;
        final String newsIdParam = newPosts[index].newsId.toString();
        final newPost = newPosts[index];
        return Container(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPostDetail(newPost),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.article, size: 60),
                title: Text(
                  newPosts[index].newsTitle.toString(),
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${newPosts[index].newsDate.toString()}',
                ),
                isThreeLine: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
