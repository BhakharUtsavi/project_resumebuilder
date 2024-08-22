import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),

      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("RESUMES",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 50),
          Image.asset("assets/images/open-cardboard-box.png",height: 70),
          SizedBox(height: 10),
          Text("No Resumes + Create New Resume",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: (){
          Navigator.of(context).pushNamed("buildoptions");
        },
      ),
    );
  }
}
