import 'package:flutter/material.dart';
import 'package:shared_prefence/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {


  static final String routeName = 'home';

  HomePage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        //backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
          child: Text('Home Page')
      ),
    );
  }
}
