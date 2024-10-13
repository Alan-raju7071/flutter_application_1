import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/Home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _customBottomsheet(context);
      },),
      body: ListView.separated(itemBuilder: (context, index) => ListTile(
        title: Text("name"),
        subtitle: Text("Designation"),

      ),
       separatorBuilder: (context, index) => Divider(),
        itemCount: 10),

    );
  }

  Future<dynamic> _customBottomsheet(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController descontroller = TextEditingController();
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context, builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,

            ),
             TextFormField(
              controller: descontroller,

             ),
             Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () {
                  
                }, child: Text("cancel"))),
                 Expanded(child: ElevatedButton(onPressed: () {
                  HomeScreenController.addEmployee();
                  Navigator.pop(context);
                  
                }, child: Text("save"))),

              ],
             )

          ],

        ),
      ),);
  }
}