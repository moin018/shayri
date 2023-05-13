import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final List<String> iqbalPoetry = [
    "Kuch baat hai ki hasti mit-ti nahin hamari, sadiyon raha hai dushman daur-e-zaman hamara",
    "Lab pe aati hai dua ban ke tamanna meri Zindagi shamma ki surat ho khudaya meri",
    "Ab na mumiidan na kharabaan Saare shaahon ke mai-khaana hai",
    "Sitaron se aage jahaan aur bhi hain Abhi ishq ke imtehaan aur bhi hain",
    "Mujhe hai hukm-e-azaan, La Ilaha Illallah",
    "Nahi tera nasheman qasr-e-sultani ke gunbad par Tu shaheen hai, basera kar paharon ki chatanon mein",
    "Zindaan ki ek aag ne us ko gul ke naqsh-e-paa pay rakha hai Ke daaman bhi na bacha, daaman-e-rah bhi na bacha",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allama Iqbal Poetry',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Iqbal ki Shayri'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: iqbalPoetry.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoetryScreen(
                          poetry: iqbalPoetry[index],
                          poetName: "Allama Iqbal",
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        iqbalPoetry[index],
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PoetryScreen extends StatelessWidget {
  final String poetry;
  final String poetName;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  PoetryScreen({required this.poetry, required this.poetName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iqbal Ki Shayri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              poetry,
              style: const TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                poetName,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
