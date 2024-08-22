import 'dart:developer';

import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class Archievements extends StatefulWidget {
  const Archievements({super.key});

  @override
  State<Archievements> createState() => _ArchievementsState();
}

class _ArchievementsState extends State<Archievements> {

  List<TextEditingController> allAchivements=[];

  @override
  void initState() {
    super.initState();
    allAchivements.add(TextEditingController());
    allAchivements.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Achivements"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: 500,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),

                Text("Enter Achivements",
                  style: TextStyle(
                      color:Colors.grey.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 15),
                ...allAchivements.map((e) =>
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: e,
                            decoration: InputDecoration(
                              hintText: "Exceeded sales 17% average",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              setState(() {
                                allAchivements.remove(e);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                ).toList(),
                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: OutlinedButton(
                    child: Icon(Icons.add),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: (){
                      setState(() {
                        allAchivements.add(TextEditingController());
                      });
                    },
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: OutlinedButton(
                    child: Text("Fetch Data"),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: (){
                      allAchivements.forEach((e) {
                        Globals.achivements.add(e.text);
                      });
                      log("${Globals.achivements}");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
