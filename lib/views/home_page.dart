import 'package:flutter/material.dart';
import 'package:restapi_flutter/models/post.dart';
import 'package:restapi_flutter/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  /*We are getting the list of Post 'class' , the name of the list is class*/
  List<Post>? posts;
  /*to check whether the variable is loaded or not*/
  var isLoaded = false;


  @override
  void initState() {
    super.initState();

    //fetch data from API 
    getData();
  }

  /*Making the data async so that we can recieve data later*/
  getData() async{

    posts = await  RemoteService().getPosts();
    if(posts != null){
      setState(() {
        /*To verify whether the data is loaded or not*/
        isLoaded = true;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),

      /*We are using the ListView builder, this helps create the list. We pass context i.e data and the index of the data*/
      body: Visibility(
        /*if the post is loaded make the data visible*/
        visible: isLoaded,
        child: ListView.builder(
          /*Using itemCount in the ListView builder limits the number of items that will get displayed in the List*/
          itemCount: posts?.length,
          itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.all(16),
            /*Wrapping the Post items in Column so that we can manage them properly*/
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange,
                  ),
                ),
                SizedBox(width: 16,),
                
                /*This will avoide the data overflow*/
                Expanded(
                  child: Column(
                    /*Using Cross Alignment to start aligns the data on the left hand side*/
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].title,
                      /*This gives the number of lines */
                      maxLines: 2,
                      /*Using overflow ellipsis will end the overflow with the double dots*/
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold),
                        ),
                        /*We are using these conditions in body (?? '') because the body part can be empty. So this means if the body is null then return blank*/
                        Text(posts![index].body ?? '',
                      /*This gives the number of lines */
                      maxLines: 2,
                      /*Using overflow ellipsis will end the overflow with the double dots*/
                      overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        /*if the post is not loaded show circular progress bar*/
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}