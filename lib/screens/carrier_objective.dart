import 'dart:developer';
import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class Currier_Objective extends StatefulWidget {
  const Currier_Objective({super.key});

  @override
  State<Currier_Objective> createState() => _Currier_ObjectiveState();
}

class _Currier_ObjectiveState extends State<Currier_Objective> {

  final GlobalKey<FormState> formKey_carrierobject = GlobalKey<FormState>();

  final TextEditingController carrierobjectivecontroller = TextEditingController();
  final TextEditingController carrierdesinationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Carrier Objective",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey_carrierobject,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Career Objective",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: carrierobjectivecontroller,
                          onSaved: (val) {
                            Globals.carrier_objective = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Career Objective";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          ),
                        ),

                        SizedBox(height: 20),

                        Text("Career Designation (Experienced Candidate)",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: carrierdesinationcontroller,
                          onSaved: (val) {
                            Globals.carrier_desination = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Career Designation";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Software Engineer",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          ),
                        ),
                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),

                                onPressed: () {
                                  if (formKey_carrierobject.currentState!.validate()) {
                                    formKey_carrierobject.currentState!.save();
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
                                  print(Globals.carrier_objective);
                                  print(Globals.carrier_desination);
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
                                  formKey_carrierobject.currentState!.reset();

                                  carrierobjectivecontroller.clear();
                                  carrierdesinationcontroller.clear();

                                  Globals.carrier_objective = null;
                                  Globals.carrier_desination = null;

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
