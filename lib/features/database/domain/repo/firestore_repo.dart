import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreRepo {
  Future<CollectionReference?> getData(String? collectionId);
  Future<dynamic> createData(String? data);
  Future<dynamic> readData();
  Future<dynamic> updateData(String? docId);
  Future<dynamic> deleteData(String? docId);
}
