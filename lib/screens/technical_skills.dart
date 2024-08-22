import 'dart:developer';
import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Technical_Skills extends StatefulWidget {
  const Technical_Skills({super.key});

  @override
  State<Technical_Skills> createState() => _Technical_SkillsState();
}

class _Technical_SkillsState extends State<Technical_Skills> {

  List<TextEditingController> allFileds=[];

  @override
  void initState() {
    super.initState();
    allFileds.add(TextEditingController());
    allFileds.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Technical Skills"),
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
          
                Text("Enter Your Skill",
                  style: TextStyle(
                    color:Colors.grey.shade500,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 15),
                ...allFileds.map((e) =>
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: e,
                            decoration: InputDecoration(
                              hintText: "C Language, Web Technical",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                                onPressed: (){
                                  setState(() {
                                    allFileds.remove(e);
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
                        allFileds.add(TextEditingController());
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
                        allFileds.forEach((e) {
                          Globals.technicalSkills.add(e.text);
                        });
                        log("${Globals.technicalSkills}");
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
