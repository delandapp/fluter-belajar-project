import 'package:flutter/material.dart';

class viewTile extends StatelessWidget {
   viewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Muhammad Deland'),
          leading: CircleAvatar(),
          trailing: Text('10.00 PM'),
          subtitle: Text('ini adalah subtitle ya...'),
          dense: true,
        ),
        Divider(color: Colors.black,),
        ListTile(
          title: Text('Muhammad Deland'),
          leading: CircleAvatar(),
          trailing: Text('10.00 PM'),
          subtitle: Text('ini adalah subtitle ya...'),
          dense: true,
        ),
        Divider(color: Colors.black,),
        ListTile(
          title: Text('Muhammad Deland'),
          leading: CircleAvatar(),
          trailing: Text('10.00 PM'),
          subtitle: Text('ini adalah subtitle ya...'),
          dense: true,
        ),
        Divider(color: Colors.black,),
        ListTile(
          title: Text('Muhammad Deland'),
          leading: CircleAvatar(),
          trailing: Text('10.00 PM'),
          subtitle: Text('ini adalah subtitle ya...'),
          dense: true,
        ),
        Divider(color: Colors.black,),
      ],
    );
  }
}