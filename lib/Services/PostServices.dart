import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp00/Models/postModel.dart';

class PostServices {
  Future<bool> createPost(PostModel postModel) async {
    try {
      var postsCollection = FirebaseFirestore.instance.collection("posts");
      await postsCollection.add(postModel.Tojson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
