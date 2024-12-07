abstract class DataBaseService {
  Future<void> addData({
    required String collectionName,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<Map <String, dynamic>> getData(
      {required String collectionName, required String docId});


  Future<bool> isUserExits({required String collectionName, required String docId});
}