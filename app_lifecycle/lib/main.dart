import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int number = 0;
  //! kenapa harus menggunakan WIdgetBindingObserver? agar bisa menggunakan didChangeAppLifecycleState
  //! Agar kita bisa mendeteksi ketika aplikasi di keluarkan

  //? inactive = ketika aplikasi di keluarkan namun masih ada cache nya (ga di clear)
  //? resumed = ketika masuk ke aplikasi lagi namun cache masih ada
  //? pause = ketika aplikasi sudah keluar dan keluar dari history app

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
    } else {}

    switch (state) {
      case AppLifecycleState.inactive:
        setState(() {
          number = 100;
        });
        break;
      case AppLifecycleState.detached:
        //.....
        break;
      case AppLifecycleState.paused:
        //.....
        break;
      case AppLifecycleState.resumed:
        //.....
        break;
      default:
    }
    //* implement didChangeAppLifecycleState
    print(state);
    // print(number);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print(number);
    super.didChangeDependencies();
  }

  //! Agar tidak terjadi kebocoran memory
  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(number.toString(),style: const TextStyle(fontSize: 60),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            number++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomePageStateless extends StatelessWidget with WidgetsBindingObserver{
  HomePageStateless({super.key}) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //! implement didChangeAppLifecycleState
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body:const Center(
        child: Text("HomePage",style: TextStyle(fontSize: 60),),
      ),
    );
  }
}