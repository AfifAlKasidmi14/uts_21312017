import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cProgramstudi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(String alamat, String jk, String nama, String npm, String programstudi) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({"alamat":alamat, "jk":jk, "nama": nama, "npm": npm, "program studi": programstudi});
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cAlamat.clear();
            cJk.clear();
            cNama.clear();
            cNpm.clear();
            cProgramstudi.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

@override
  void onInit() {
    cAlamat = TextEditingController();
    cJk = TextEditingController();
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cProgramstudi = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cAlamat.dispose();
    cJk.dispose();
    cNama.dispose();
    cNpm.dispose();
    cProgramstudi.dispose();
    super.onClose();
  }
}
