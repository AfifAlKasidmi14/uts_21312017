import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cAlamat,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "alamat mahasiswa"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cJk,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "jk mahasiswa"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama mahasiswa"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cNpm,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "npm mahasiswa"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cProgramstudi,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "program studi mahasiswa"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.cAlamat.text,
                controller.cJk.text,
                controller.cNama.text,
                controller.cNpm.text,
                controller.cProgramstudi.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
