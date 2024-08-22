import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {

  bool isSwitchon=false;

  final GlobalKey<FormState> declarationKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Resume Builder",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Declaration",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Switch(
                          value: isSwitchon,
                          onChanged: (val){
                            setState(() {
                              isSwitchon=val!;
                            });
                          }
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: isSwitchon,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: declarationKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: descriptionController,
                              onSaved: (val) {
                                Globals.declarationdescription = val;
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
                                hintText: "Descripation",
                                border: OutlineInputBorder(),
                              ),
                            ),
        
                            SizedBox(height: 20,),
        
                            Divider(),
        
                            SizedBox(height: 20,),
        
                            Row(
                              children: [
                                Text("Date",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
        
                                Spacer(),
        
                                Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Place(Interview   \n",
                                        style: TextStyle(
                                              color: Colors.grey.shade400,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                        ),
                                        TextSpan(
                                          text: "venue/city)",
                                          style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ]
                                    )
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 120,
                                  child: TextFormField(
                                    controller: dateController,
                                    onSaved: (val) {
                                      Globals.date = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter Your Date";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.datetime,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "DD/MM/YYYY",
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                SizedBox(
                                  height: 50,
                                  width: 120,
                                  child: TextFormField(
                                    controller: placeController,
                                    onSaved: (val) {
                                      Globals.place = val;
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
                                      hintText: "Eg. Surat",
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                                    ),
                                  ),
                                ),
                              ],
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
                                      if (declarationKey.currentState!.validate()) {
                                        declarationKey.currentState!.save();
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
                                      print(Globals.declarationdescription);
                                      print(Globals.date);
                                      print(Globals.place);
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
                                      declarationKey.currentState!.reset();
        
                                      descriptionController.clear();
                                      dateController.clear();
                                      placeController.clear();
        
                                      Globals.declarationdescription = null;
                                      Globals.date = null;
                                      Globals.place = null;
        
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
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
