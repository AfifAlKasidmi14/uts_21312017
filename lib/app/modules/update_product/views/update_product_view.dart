import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product View'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['alamat'];
            controller.cNama.text = data['jk'];
            controller.cNama.text = data['nama'];
            controller.cNpm.text = data['npm'].toString();
            controller.cNama.text = data['programstudi'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cAlamat,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "alamat Mahasiswa"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cJk,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "jk Mahasiswa"),
                  ),
                  TextField(
                    controller: controller.cNama,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Nama Mahasiswa"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cNpm,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Npm Mahasiswa"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cProgramstudi,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "program studi Mahasiswa"),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => controller.updateProduct(
                      controller.cAlamat.text,
                      controller.cJk.text,
                      controller.cNama.text,
                      controller.cNpm.text,
                      controller.cProgramstudi.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
