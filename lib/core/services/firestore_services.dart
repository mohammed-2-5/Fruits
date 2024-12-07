import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits/core/services/data_base_services.dart';

class FireStoreService implements DataBaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String collectionName,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await fireStore.collection(collectionName).doc(docId).set(data);
    } else {
      await fireStore.collection(collectionName).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String collectionName, required String docId}) async {
    var data = await fireStore.collection(collectionName).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isUserExits(
      {required String collectionName, required String docId}) async {
    var data = await fireStore.collection(collectionName).doc(docId).get();
    return data.exists;
  }
}
