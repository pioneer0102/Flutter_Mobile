import 'package:flutter/material.dart';
import 'package:my_flutter/projects/boats_app/models/boat.dart';

class BoatListPage extends StatefulWidget {
  const BoatListPage({Key? key}) : super(key: key);

  @override
  BoatListPageState createState() => BoatListPageState();
}

class BoatListPageState extends State<BoatListPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boats')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: Boat.listBoats.length,
        itemBuilder: (context, index) {
          final boat = Boat.listBoats[index];
          return const Text('Boat');
        },
      ),
    );
  }
}
