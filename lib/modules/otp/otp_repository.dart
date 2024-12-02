import 'package:tcklit_app/networks/api_service.dart';

/*class LoginDaosSource {
  late final PostDao postDao;
  LoginDaosSource(this.postDao);
}*/

class OTPRepository {
  late final ApiService apiService;

  // late final LoginDaosSource daosSource;

  OTPRepository({required this.apiService});

/*Future<List<PostEntity>> fetchPostsFromDB() async {

    await daosSource.postDao
        .insertUser(PostEntity(title: "Babu", body: "Hello Post Insertion"));
    return await daosSource.postDao.fetchAllPosts();
  }*/
}
