import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  List<Tab> myTab = [
                Tab(text: 'Home'),
                Tab(text: 'Contact'),
                Tab(text: 'About'),
                Tab(icon: Icon(Icons.ac_unit_outlined)),
              ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        // Default Index
        initialIndex: 2, 
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar Demo'),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w100),
              // indicatorColor: Colors.black,
              // indicatorWeight: 5,
              // indicatorPadding: EdgeInsets.all(5),
              indicator: BoxDecoration(
                // color: Colors.amber,
                // borderRadius: BorderRadius.circular(50),
                border: Border(bottom: BorderSide(color: Colors.black, width: 5)),
              ),
              tabs: myTab,
            )
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Tab 1', style: TextStyle(fontSize: 30),)),
              Center(child: Text('Tab 2', style: TextStyle(fontSize: 30),)),
              Center(child: Text('Tab 3', style: TextStyle(fontSize: 30),)),
              Center(child: Text('Tab 4', style: TextStyle(fontSize: 30),)),
            ],
          ),
        ),
      ),
    );
  }
}
