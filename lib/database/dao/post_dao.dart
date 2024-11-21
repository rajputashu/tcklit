import 'package:floor/floor.dart';
import 'package:tcklit_app/database/entities/post_entity.dart';

@dao
abstract class PostDao {
  @Query("Select * from PostEntity")
  Future<List<PostEntity>> fetchAllPosts();

  @Query('SELECT * FROM users WHERE id = :id')
  Future<PostEntity?> findUserById(int id);

  @insert
  Future<void> insertUser(PostEntity post);

  @update
  Future<void> updateUser(PostEntity post);

  @delete
  Future<void> deleteUser(PostEntity post);
}
