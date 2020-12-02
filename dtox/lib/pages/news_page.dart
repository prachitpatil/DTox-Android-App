import 'package:dtox/models/news_article_model.dart';
import 'package:dtox/services/news_fetcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('D-Tox',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text('News',
            style: TextStyle(
              color: Colors.blue,
            ),
            ),
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              //Blogs
              Container(
                padding: EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                      );
                    }
                ),
              ),
            ],
          ),

          //46:25


        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc;
  BlogTile({@required this.imageUrl, @required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl)),
          SizedBox(
            height: 8.0,
          ),
          Text(title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(desc,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14.0,
          ),
          ),
        ],
      ),
    );
  }
}

