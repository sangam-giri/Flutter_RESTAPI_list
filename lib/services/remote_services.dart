/*This will help us fetch data from the internet - add http package to use it*/
import '../models/post.dart';
/*Setting https package as http for easier use*/
import 'package:http/http.dart' as http;
class RemoteService
{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    /*checking it if the status code is successful or not (200)*/
    if(response.statusCode == 200){

      var json = response.body;
      return postFromJson(json);

    }
  }
}