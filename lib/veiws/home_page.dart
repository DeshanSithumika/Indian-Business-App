import 'package:flutter/material.dart';
import 'package:reading_app/models/article.dart';
import 'package:reading_app/services/api_services.dart';
import 'package:reading_app/veiws/content_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices client = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read latest news"),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;

            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) => Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContentPage(
                                      description: [
                                        articles[index].author.toString(),
                                        articles[index].urlToImage.toString(),
                                        articles[index].title.toString(),
                                        articles[index].description.toString(),
                                        articles[index].url.toString(),
                                        articles[index].content.toString(),
                                        articles[index].publishedAt.toString(),
                                      ],
                                    )));
                      }),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                articles[index].urlToImage.toString()),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      articles[index].title.toString(),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
