import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  final GlobalKey<FormState> projectKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController technologiesController = TextEditingController();
  final TextEditingController rolesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Project",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Project Title",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: titleController,
                          onSaved: (val) {
                            Globals.title = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Project Title";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Resume Builder App",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Project Title",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        CheckboxListTile(
                          title: Text("C Programming"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: Globals.isCprogramming,
                            onChanged: (val){
                              setState(() {
                                Globals.isCprogramming=val!;
                              });
                            }
                        ),
                        CheckboxListTile(
                            title: Text("C++"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: Globals.isCpp,
                            onChanged: (val){
                              setState(() {
                                Globals.isCpp=val!;
                              });
                            }
                        ),
                        CheckboxListTile(
                            title: Text("Flutter"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: Globals.isFlutter,
                            onChanged: (val){
                              setState(() {
                                Globals.isFlutter=val!;
                              });
                            }
                        ),
                        SizedBox(height: 15,),
                        Text("Roles",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: rolesController,
                          onSaved: (val) {
                            Globals.roles = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Role";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Organize team members, Code analysis",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Technologies",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: technologiesController,
                          onSaved: (val) {
                            Globals.technologies = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Technologies";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "5- Programmers",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Projetc Description",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          onSaved: (val) {
                            Globals.description = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Your Description";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Enter Your Project Description",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  if (projectKey.currentState!.validate()) {
                                    projectKey.currentState!.save();
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
                                  print(Globals.title);
                                  print(Globals.roles);
                                  print(Globals.technologies);
                                  print(Globals.description);
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
                                  projectKey.currentState!.reset();

                                  titleController.clear();
                                  rolesController.clear();
                                  technologiesController.clear();
                                  descriptionController.clear();

                                  Globals.title = null;
                                  Globals.roles = null;
                                  Globals.technologies = null;
                                  Globals.description = null;

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
            ),
          ],
        ),
      ),
    );
  }
}
