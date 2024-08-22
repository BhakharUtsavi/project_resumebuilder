import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class References extends StatefulWidget {
  const References({super.key});

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {

  final GlobalKey<FormState> ReferencesKey = GlobalKey<FormState>();

  final TextEditingController referenceController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("References",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: ReferencesKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reference Name",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: referenceController,
                          onSaved: (val) {
                            Globals.reference = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Suresh Shah",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          ),
                        ),
        
                        SizedBox(height: 20),
        
                        Text("Designation",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: designationController,
                          onSaved: (val) {
                            Globals.designation = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Marketing Manager, ID-34332",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          ),
                        ),
        
                        SizedBox(height: 20),
        
                        Text("Organization/Institute",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: organizationController,
                          onSaved: (val) {
                            Globals.organization = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Green Energy Pvt. Ltd",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          ),
                        ),
        
                        SizedBox(height: 30),
        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  if (ReferencesKey.currentState!.validate()) {
                                    ReferencesKey.currentState!.save();
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
                                  print(Globals.reference);
                                  print(Globals.designation);
                                  print(Globals.organization);
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
                                  ReferencesKey.currentState!.reset();
        
                                  referenceController.clear();
                                  designationController.clear();
                                  organizationController.clear();
        
                                  Globals.reference = null;
                                  Globals.designation = null;
                                  Globals.organization = null;
        
                                  //Dismiss Keyboead Programaticaly
                                  FocusManager.instance.primaryFocus?.unfocus();
        
                                  //Dismiss Keyboead Programaticaly
                                  //SystemChannels.textInput.invokeMethod("TextInput.hide");
                                },
                                child: Text("Clear")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
