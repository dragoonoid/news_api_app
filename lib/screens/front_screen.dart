import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/screens/webView_screen.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  var list;
  var newsList = [];
  bool isLoading = true;
  String curr="Business";
  @override
  void initState() {
    list = CategoryList();
    getList();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  Future getList() async {
    var x = await getNewsList();
    setState(() {
      newsList = x;
    });
  }
  Future getCategoryList(String str) async{
    if(str==curr){
      return;
    }
    setState(() {
      isLoading=true;
    });
    var x = await getCategoryNewsList(str);
    setState(() {
      newsList = x;
      isLoading=false;
      curr=str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'News ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'App',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10, top: 10),
                            child: GestureDetector(
                              onTap: (){
                                getCategoryList(list[i].name);
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: list[i].imageUrl,
                                      height: 60,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black26,
                                    ),
                                    child: Center(
                                      child: Text(
                                        list[i].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: list.length,
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (_, i) {
                        return newsTile(newsList[i]);
                      },
                      itemCount: newsList.length,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  newsTile(News x) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WebViewScreen(url: x.url);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              x.urlToImage,
            ),
          ),
          Text(
            x.title??"",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            x.description,
            style: const TextStyle(color: Colors.grey),
          ),
        ]),
      ),
    );
  }
}
