import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';

class Personal_details extends StatefulWidget {
  const Personal_details({super.key});

  @override
  State<Personal_details> createState() => _Personal_detailsState();
}

class _Personal_detailsState extends State<Personal_details> {

  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  GlobalKey<FormState> personalDetailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Personal Details",
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: personalDetailKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "DOB",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: dobController,
                      onSaved: (val) {
                        Globals.dob = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Birth Date";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "DD/MM/YYYY",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Marital Status",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RadioListTile<String>(
                      title: const Text(
                        "Single",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      value: "single",
                      groupValue: Globals.maritalStatus,
                      onChanged: (val) {
                        setState(() {
                          Globals.maritalStatus = val!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text(
                        "Married",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      value: "married",
                      groupValue: Globals.maritalStatus,
                      onChanged: (val) {
                        setState(() {
                          Globals.maritalStatus = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Languages Known",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "English",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Globals.isEnglish,
                      onChanged: (val) {
                        setState(() {
                          Globals.isEnglish = val!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Hindi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Globals.isHindi,
                      onChanged: (val) {
                        setState(() {
                          Globals.isHindi = val!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Gujarati",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Globals.isGujrati,
                      onChanged: (val) {
                        setState(() {
                          Globals.isGujrati = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Nationality",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: nationalityController,
                      onSaved: (val) {
                        Globals.nationality = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Nationality";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Indian",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (personalDetailKey.currentState!.validate()) {
                              personalDetailKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Form Validation Successful..."),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  action: SnackBarAction(
                                    label: "DISMISS",
                                    textColor: Colors.black,
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                    },
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Form Validation Failed..."),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                            // Debugging prints
                            print("=========");
                            print("DOB: ${Globals.dob}");
                            print("Marital Status: ${Globals.maritalStatus}");
                            print("Languages Known: English: ${Globals.isEnglish}, Hindi: ${Globals.isHindi}, Gujarati: ${Globals.isGujrati}");
                            print("Nationality: ${Globals.nationality}");
                            print("=========");
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Save"),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            personalDetailKey.currentState!.reset();
                            dobController.clear();
                            nationalityController.clear();

                            // Reset Globals
                            Globals.dob = null;
                            Globals.maritalStatus = null;
                            Globals.isEnglish = false;
                            Globals.isHindi = false;
                            Globals.isGujrati = false;
                            Globals.nationality = null;

                            // Dismiss Keyboard
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Clear"),
                        ),
                      ],
                    ),
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
