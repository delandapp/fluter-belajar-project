import 'package:flutter/material.dart';
import 'package:widget_lifecycle/pages/other_page.dart';

class ConterWidget extends StatefulWidget {
  ConterWidget({
    super.key,
    required this.initValue,
  }) {
    print("--------------------------");
    print("constructor widget conter");
  }

  int initValue;

  @override
  State<ConterWidget> createState() {
    print("create state");
    return _ConterWidgetState();
  }
}

class _ConterWidgetState extends State<ConterWidget> {
  
  @override
  void initState() {
    super.initState();
    print("init state");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("did change dependencies");
  }

  @override
  void didUpdateWidget(covariant ConterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("old_state : ${oldWidget.initValue}");
    print("did update widget");
    widget.initValue < oldWidget.initValue ? widget.initValue = oldWidget.initValue : "";
    print("update_state : ${widget.initValue}");
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print("build widget conter");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            widget.initValue.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
        TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(OtherPage.nameRoute,arguments: widget.initValue),
            child: const Text("Go To Other Page"))
      ],
    );
  }
}
