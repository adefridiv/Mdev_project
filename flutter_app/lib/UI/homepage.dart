import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/UI/detailpage.dart';

void logout() {
  FirebaseAuth.instance.signOut();
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 52, 47),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          )
        ],
        title: Center(
            child: const Text(
          'Demo App',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Color.fromRGBO(4, 32, 28, 1),
                height: 310,
                width: 310,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(100), // Image radius
                          child: Image.asset('assets1/1.PNG')),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Detail()));
                      },
                      child: Text(
                        'Samsung SSD T7 Shield Portable 1TB',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                    ),
                    Text(
                      'Rp1.400.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            //_____________________________________________________
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Color.fromRGBO(4, 32, 28, 1),
                height: 310,
                width: 310,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(100), // Image radius
                          child: Image.asset('assets1/3.PNG')),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'SanDisk E61 Extreme Portable SSD 500GB',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Text(
                      'Rp1.350.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            //_____________________________________________________
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Color.fromRGBO(4, 32, 28, 1),
                height: 310,
                width: 310,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(100), // Image radius
                          child: Image.asset('assets1/2.PNG')),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Samsung SSD 870 EVO Portable 250GB',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                    ),
                    Text(
                      'Rp900.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            //_____________________________________________________
          ],
        ),
      ),
    );
  }
}
