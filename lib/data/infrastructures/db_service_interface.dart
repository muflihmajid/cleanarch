abstract class DBServiceInterface {
  Future<int> insert(String sql);
  Future<int> update(String sql);
  Future<int> delete(String sql);
  Future<List<Map>> select(String sql);
}