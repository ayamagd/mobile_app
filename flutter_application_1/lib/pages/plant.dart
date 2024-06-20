import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/database_manager.dart';

class Plant extends StatefulWidget {
  const Plant({Key? key}) : super(key: key);

  @override
  _PlantState createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Image"),
      ),
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.network(
              snapshot.data.toString(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}