import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cProgramstudi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);
    return docRef.get();
  }

  void updateProduct(String alamat, String jk, String nama, String npm, String programstudi, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc('id');
    try {
      await productById.update({
        "alamat":alamat,
        "jk":jk,
        "name": nama,
        "npm": npm,
        "program studi":programstudi,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data mahasiswa",
        onConfirm: () {
          cAlamat.clear();
          cJk.clear();
          cNama.clear();
          cNpm.clear();
          cProgramstudi.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Produk.",
      );
    }
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
