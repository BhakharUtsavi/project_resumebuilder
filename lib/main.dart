import 'package:ch3_project_resumebulider/screens/archievements.dart';
import 'package:ch3_project_resumebulider/screens/build_options_page.dart';
import 'package:ch3_project_resumebulider/screens/carrier_objective.dart';
import 'package:ch3_project_resumebulider/screens/contact_info_page.dart';
import 'package:ch3_project_resumebulider/screens/declaration.dart';
import 'package:ch3_project_resumebulider/screens/eduction.dart';
import 'package:ch3_project_resumebulider/screens/experiences.dart';
import 'package:ch3_project_resumebulider/screens/home_page.dart';
import 'package:ch3_project_resumebulider/screens/interest_hobbies.dart';
import 'package:ch3_project_resumebulider/screens/personal_details.dart';
import 'package:ch3_project_resumebulider/screens/projects.dart';
import 'package:ch3_project_resumebulider/screens/references.dart';
import 'package:ch3_project_resumebulider/screens/technical_skills.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main(){
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.amber,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.red,
  //   )
  // );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context){
          return HomePage();
        },
        "buildoptions":(context){
          return Build_Options_page();
        },
        "contact_info_page":(context){
          return Contact_Info_Page();
        },
        "carrier_objective":(context){
          return Currier_Objective();
        },
        "personal_details_page":(context){
          return Personal_details();
        },
        "eduction_page":(context){
          return Eduction();
        },
        "experiences_page":(context){
          return Experiences();
        },
        "technical_skills_page":(context){
          return Technical_Skills();
        },
        "interest_hobbies_page":(context){
          return Interest_Hobbies_Page();
        },
        "projects_page":(context){
          return Projects();
        },
        "archievements_page":(context){
          return Archievements();
        },
        "references_page":(context){
          return References();
        },
        "declaration_page":(context){
          return Declaration();
        },
      },
    ),
  );
}