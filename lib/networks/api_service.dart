import 'package:tcklit_app/dto/post_dto.dart';
import 'package:tcklit_app/networks/dio_client.dart';

class ApiService {
  final DioClient dioClient;
  ApiService(this.dioClient);

  Future<List<Post>> fetchList() async {
    final response = await dioClient.get('/posts');
    final List<Post> post =
        (response.data as List).map((item) => Post.fromJson(item)).toList();
    return post;
  }
}
