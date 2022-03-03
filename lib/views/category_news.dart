import 'package:flutter/material.dart';
import 'package:khabri/helper/news.dart';
import 'package:khabri/models/article_model.dart';
import 'package:khabri/views/article_view.dart';
class CategoryNews extends StatefulWidget {

   final String category;

  const CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {



  // new List<ArticleModel>()
  List<ArticleModel> articles = [];
bool _loading =true;
  @override
  void initState() {
    // TODO: implement initState
    getCategoryNews();
    super.initState();
  }

  getCategoryNews() async{
    CategoryNewsClass news = CategoryNewsClass();
    await news.getNews(widget.category);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("khabri",style: TextStyle(color: Colors.white),),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      body: _loading ?  const Center(
        child: CircularProgressIndicator(),
      )
          :SingleChildScrollView(
            child: Container(
        child: Column(
            children:<Widget> [
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context ,index ){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    } ),
              )
            ],
        ),
      ),
          ),


    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl , title, desc,url;
  // const  BlogTile({ Key?  Key, required this.imageUrl, required this.title, required this.desc}) : super(key: key);
  BlogTile({ required this.imageUrl, required this.title,required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ArticleView(blogUrl: url)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children:<Widget> [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title,style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
                color: Colors.black54
            ),)
          ],

        ),


      ),
    );
  }
}
