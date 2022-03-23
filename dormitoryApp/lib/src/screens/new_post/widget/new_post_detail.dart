import 'package:dormitory_app/models/new_post.dart';
import 'package:flutter/material.dart';

class NewPostDetail extends StatelessWidget {
  final NewPost newPost;

  const NewPostDetail(NewPost this.newPost, {Key? key}) : super(key: key);
  final String _title = "รายละเอียดข่าว";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                alignment: Alignment.center,
                child: Icon(
                  Icons.article,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Text(
                  _title,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'หัวข้อข่าว',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 62,
                    ),
                    Text(
                      newPost.newsTitle.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'รายละเอียด',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      newPost.description.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'วันที่',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Text(
                      newPost.newsTitle.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
