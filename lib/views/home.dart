import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:khabri/helper/data.dart';
import 'package:khabri/helper/news.dart';
import 'package:khabri/models/article_model.dart';
import 'package:khabri/models/category_Model.dart';
import 'package:khabri/views/article_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories =  <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {

    // _loading = true;
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();

  }

  getNews() async{
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("khabri",style: TextStyle(color: Colors.white),),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ) ,
      body: _loading ?  const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children:<Widget> [

             /// categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){

                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categorName,
                    );
                    }
                ),
              ),


               /// blogs
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

class CategoryTile extends StatelessWidget {

  final imageUrl , categoryName;

  CategoryTile({this.imageUrl,this.categoryName});
  // const CategoryTile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(

          children:<Widget> [
            ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                    imageUrl: imageUrl,width: 120, height: 60,fit: BoxFit.cover)
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.green ,
              ),
              width: 120, height: 60,

              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
              ),
            )

          ],
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

