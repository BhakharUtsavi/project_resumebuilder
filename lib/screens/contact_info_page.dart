import 'dart:io';
import 'package:ch3_project_resumebulider/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Contact_Info_Page extends StatefulWidget {
  const Contact_Info_Page({super.key});

  @override
  State<Contact_Info_Page> createState() => _Contact_Info_PageState();
}

class _Contact_Info_PageState extends State<Contact_Info_Page> {

  int initialIndex = 0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   nameController.text=(Globals.name==null) ? "" : Globals.name!;  // pre-fill the TextFormFiled
  //   emailController.text=(Globals.name==null) ? "" : Globals.email!;
  //   phoneController.text=(Globals.name==null) ? "" : Globals.phone!;
  //   addressController.text=(Globals.name==null) ? "" : Globals.address!;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Resume Workspace",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        initialIndex = 0;
                      });
                    },
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        initialIndex = 1;
                      });
                    },
                    child: Text(
                      "Phone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IndexedStack(
              index: initialIndex,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              // onFieldSubmitted: (val){
                              //   print("=======");
                              //   print(val);
                              //   print("=======");
                              // },
                              onSaved: (val) {
                                Globals.name = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Your Name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              //obscureText: true, //hide the password
                              //obscuringCharacter: "!", //character ! avi rite show thse
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Enter Your Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    nameController.clear();
                                    Globals.name = null;
                                  },
                                ),
                                //suffixIcon: Text("KG"),
                                //suffix: Text("KG"),
                                //enabled: true,
                                //filled:true, //TextFormField color thi fill kre
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: emailController,
                              // onFieldSubmitted: (val){
                              //   print("=======");
                              //   print(val);
                              //   print("=======");
                              // },
                              onSaved: (val) {
                                Globals.email = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Your Email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              //obscureText: true, //hide the password
                              //obscuringCharacter: "!", //character ! avi rite show thse
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Enter Your Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                prefixIcon: Icon(Icons.email),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    emailController.clear();
                                    Globals.email = null;
                                  },
                                ),
                                //suffixIcon: Text("KG"),
                                //suffix: Text("KG"),
                                //enabled: true,
                                //filled:true, //TextFormField color thi fill kre
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: phoneController,
                              //onFieldSubmitted: (val){
                              //   print("=======");
                              //   print(val);
                              //   print("=======");
                              // },
                              onSaved: (val) {
                                Globals.phone = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Your Phone";
                                } else if (val.length < 10 || val.length > 10) {
                                  return "Conact no. must be 10 digits...";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              //obscureText: true, //hide the password
                              //obscuringCharacter: "!", //character ! avi rite show thse
                              decoration: InputDecoration(
                                labelText: "Phone",
                                hintText: "Enter Your Phone",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                prefixIcon: Icon(Icons.phone),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    phoneController.clear();
                                    Globals.phone = null;
                                  },
                                ),
                                //suffixIcon: Text("KG"),
                                //suffix: Text("KG"),
                                //enabled: true,
                                //filled:true, //TextFormField color thi fill kre
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: addressController,
                              // onFieldSubmitted: (val){
                              //   print("=======");
                          //   print(val);
                              //   print("=======");
                              // },
                              onSaved: (val) {
                                Globals.address = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Your Address";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              //obscureText: true, //hide the password
                              //obscuringCharacter: "!", //character ! avi rite show thse
                              decoration: InputDecoration(
                                labelText: "Address",
                                hintText: "Enter Your Address",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                prefixIcon: Icon(Icons.location_on),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    addressController.clear();
                                    Globals.address = null;
                                  },
                                ),
                                //suffixIcon: Text("KG"),
                                    //suffix: Text("KG"),
                                //enabled: true,
                                //filled:true, //TextFormField color thi fill kre
                              ),
                            ),
                          ],
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
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
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
                                print(Globals.name);
                                print(Globals.email);
                                print(Globals.phone);
                                print(Globals.address);
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
                                formKey.currentState!.reset();

                                nameController.clear();
                                emailController.clear();
                                phoneController.clear();
                                addressController.clear();

                                Globals.name = null;
                                Globals.email = null;
                                Globals.phone = null;
                                Globals.address = null;

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
                Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        child: (imageFile == null) ? Text("ADD") : Container(),
                        backgroundImage:
                            (imageFile == null) ? null : FileImage(imageFile!),
                      ),
                      FloatingActionButton(
                          child: Icon(Icons.add),
                          elevation: 0,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: CircleBorder(),
                          onPressed: () async {
                            XFile? xFile = await picker.pickImage(
                                source: ImageSource.camera);
                            imageFile = File(xFile!.path);
                            setState(() {});
                          }),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
