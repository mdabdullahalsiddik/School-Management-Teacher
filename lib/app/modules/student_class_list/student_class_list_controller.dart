import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StudentClassListController extends GetxController {
  fir() async {
    var a = FirebaseFirestore.instance
        .collection("class")
        .doc("Computer")
        .collection("A")
        .doc("01")
        .get()
        .then((value) {
      print(value.data());
    });
  }
}
