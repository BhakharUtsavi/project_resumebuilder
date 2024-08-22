import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class Eduction extends StatefulWidget {
  const Eduction({super.key});

  @override
  State<Eduction> createState() => _EductionState();
}

class _EductionState extends State<Eduction> {

  final GlobalKey<FormState> eductionKey = GlobalKey<FormState>();

  final TextEditingController courseController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController yearofpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Eduction",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            alignment: Alignment.center,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: eductionKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course/Degree",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: courseController,
                      onSaved: (val) {
                        Globals.course = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Course/Degree";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "B.Tech Information Technology",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("School/College/Institute",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: schoolController,
                      onSaved: (val) {
                        Globals.school = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your School/College/Institute";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Bhagavan Mahivar University",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("School/College/Institute",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: instituteController,
                      onSaved: (val) {
                        Globals.institute = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your School/College/Institute";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "70% (or) 7.0 CGPA",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Year Of Pass",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: yearofpassController,
                      onSaved: (val) {
                        Globals.yearofpass = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Year Of Pass";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "2019",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (eductionKey.currentState!.validate()) {
                                eductionKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Form Validation Sucessful..."),
                                    backgroundColor: Colors.grey,
                                    behavior: SnackBarBehavior.floating,
                                    action: SnackBarAction(
                                      label: "DISMISS",
                                      textColor: Colors.black,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Form Validation Failed..."),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );

                                print("=========");
                                print("Form Validation is Failed...");
                                print("=========");
                              }
                              print("=========");
                              print(Globals.course);
                              print(Globals.school);
                              print(Globals.institute);
                              print(Globals.yearofpass);
                              print("=========");
                            },
                            child: Text("Save")),
                        SizedBox(width: 20),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              eductionKey.currentState!.reset();

                              courseController.clear();
                              schoolController.clear();
                              instituteController.clear();
                              yearofpassController.clear();

                              Globals.course = null;
                              Globals.school = null;
                              Globals.institute = null;
                              Globals.yearofpass = null;

                              //Dismiss Keyboead Programaticaly
                              FocusManager.instance.primaryFocus?.unfocus();

                              //Dismiss Keyboead Programaticaly
                              //SystemChannels.textInput.invokeMethod("TextInput.hide");
                            },
                            child: Text("Clear")),
                      ],
                    )
                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
