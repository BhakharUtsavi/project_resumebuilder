import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  TextEditingController companynameController = TextEditingController();
  TextEditingController schoolcollegeinstituteController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController datejoinedController = TextEditingController();
  TextEditingController dateexitController = TextEditingController();

  GlobalKey<FormState> experienceKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Experiences",
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
                height: 750,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: experienceKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Company Name",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: companynameController,
                          onSaved: (val) {
                            Globals.course = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Company Name";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "New Enterprise, San Francisco",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "School/College/Institute",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: schoolcollegeinstituteController,
                          onSaved: (val) {
                            Globals.school = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter School/College/Institute";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Quality Test Engineer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Role (optional)",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: roleController,
                          onSaved: (val) {
                            Globals.role = val;
                          },
                          textInputAction: TextInputAction.next,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText:
                            "Working with team members to come up with new concepts and product analysis...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Employed Status",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Radio(
                                value: "previouslyemployed",
                                groupValue: Globals.employedStatus,
                                onChanged: (val) {
                                  setState(() {
                                    Globals.employedStatus = val!;
                                  });
                                },
                              ),
                              const Text(
                                "Previously Employed",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio(
                                value: "currentlyemployed",
                                groupValue: Globals.employedStatus,
                                onChanged: (val) {
                                  setState(() {
                                    Globals.employedStatus = val!;
                                  });
                                },
                              ),
                              const Text(
                                "Currently Employed",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Text(
                              "Date Joined",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Date Exit",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: TextFormField(
                                controller: datejoinedController,
                                onSaved: (val) {
                                  Globals.dateJoined = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter Date Joined";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: "DD/MM/YYYY",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: TextFormField(
                                controller: dateexitController,
                                onSaved: (val) {
                                  Globals.dateExit = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter Date Exit";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: "DD/MM/YYYY",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                if (experienceKey.currentState!.validate()) {
                                  experienceKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Form Validation Successful..."),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                      action: SnackBarAction(
                                        label: "DISMISS",
                                        textColor: Colors.black,
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                      const Text("Form Validation Failed..."),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                                // Debugging prints
                                print("=========");
                                print("course: ${Globals.course}");
                                print("school: ${Globals.school}");
                                print("role: ${Globals.role}");
                                print("dateJoined: ${Globals.dateJoined}");
                                print("dateExit: ${Globals.dateExit}");
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
                                experienceKey.currentState!.reset();

                                companynameController.clear();
                                schoolcollegeinstituteController.clear();
                                roleController.clear();
                                datejoinedController.clear();
                                dateexitController.clear();

                                // Reset Globals
                                Globals.course = null;
                                Globals.school = null;
                                Globals.role = null;
                                Globals.dateJoined = null;
                                Globals.dateExit = null;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Form Reset Successful..."),
                                    backgroundColor: Colors.blue,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text("Reset"),
                            ),
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
