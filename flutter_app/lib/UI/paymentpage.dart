import 'package:flutter/material.dart';
import 'package:flutter_app/UI/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  PaymentPage({
    super.key,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final user = FirebaseAuth.instance.currentUser!;

  final nama = TextEditingController();

  final nomor = TextEditingController();

  final alamat = TextEditingController();
  String harga = 'Rp.1.400.000';
  String produk = 'Samsung SSD T7 Shield Portable 1TB';

  Future submitpaymentform() async {
    paymentform(
      nama.text.trim(),
      int.parse(nomor.text.trim()),
      alamat.text.trim(),
    );
  }

  Future paymentform(
    String _nama,
    int _nomor,
    String _alamat,
  ) async {
    await FirebaseFirestore.instance.collection('payment').add({
      'nama': _nama,
      'nomor': _nomor,
      'alamat': _alamat,
      'harga': harga,
      'nama produk': produk,
      'email': user.email!,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 31, 28),
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Demo App',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Text(
              'untuk melanjutkan pembelian isilah form dibawah dan upload bukti pembayaran',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Color.fromARGB(255, 221, 232, 17)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    'nama',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            TextField(
              controller: nama,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    'nomor telepon',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            TextField(
              controller: nomor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_ic_call_outlined),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    'alamat',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            TextField(
              controller: alamat,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_home_work_outlined),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Rp1.400.000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('upload file'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  submitpaymentform();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
