import 'package:flutter/material.dart';
import 'package:widget_lifecycle/widgets/widget_counter.dart';

class ConterPage extends StatefulWidget {
  static const nameRoute = '/counter-page';
  ConterPage({super.key}) {
    print("===========");
    print("constructor counter page");
  }

  @override
  State<ConterPage> createState() {
    // print("create state");
    return _ConterPageState();
  }
}

class _ConterPageState extends State<ConterPage> {
  int initValue = 0;

  // @override
  // void initState() { 
  //   super.initState();
  //   print("init state");
  // }

  @override
  void didChangeDependencies() {
    print("did change dependencies counter page");
    var numberState = ModalRoute.of(context)?.settings.arguments;
    if(numberState != null) {
      numberState = numberState as int;
      initValue = numberState;
    }
    super.didChangeDependencies();
  }

  // @override
  // void didUpdateWidget(covariant ConterPage oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   print("did update widget");
  // }

  // @override
  // void dispose() { 
  //   super.dispose();
  //   print("dispose counter page");
  // }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print("deactivate counter page");
  // }

  @override
  Widget build(BuildContext context) {
    print("build counter page");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Lifecycle'),
        centerTitle: true,
      ),
      body: ConterWidget(initValue: initValue),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            initValue++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

