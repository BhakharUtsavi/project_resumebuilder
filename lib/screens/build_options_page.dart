import 'package:ch3_project_resumebulider/utils/all_build_options.dart';
import 'package:flutter/material.dart';

class Build_Options_page extends StatefulWidget {
  const Build_Options_page({super.key});

  @override
  State<Build_Options_page> createState() => _Build_Options_pageState();
}

class _Build_Options_pageState extends State<Build_Options_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Build Options",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            ...allBuildOptions.map((e) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(e['image'],width: 50),
                        SizedBox(width: 20),
                        Text(e['title'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.of(context).pushNamed(e['route']);
                        }, icon: Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    Divider(),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),

    );
  }
}
