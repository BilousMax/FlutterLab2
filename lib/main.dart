import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Тварини',
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images.jpg', width: 500, height: 350),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen('animals', 'assets/animals'),
                    ),
                  );
                },
                child: Text('Тварини'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen('birds', 'assets/birds'),
                    ),
                  );
                },
                child: Text('Птахи'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen('fishes', 'assets/fishes'),
                    ),
                  );
                },
                child: Text('Риби'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final String imagePath;

  CategoryScreen(this.categoryName, this.imagePath);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int currentImageIndex = 1;
  int totalImages = 3;

  void showNextImage() {
    if (currentImageIndex < totalImages) {
      setState(() {
        currentImageIndex++;
      });
    }
  }

  void showPreviousImage() {
    if (currentImageIndex > 1) {
      setState(() {
        currentImageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${widget.imagePath}/${widget.categoryName.toLowerCase()}-$currentImageIndex.jpg',
              width: 500,
              height: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: showPreviousImage,
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: showNextImage,
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('На головну'),
            ),
          ],
        ),
      ),
    );
  }
}
