import 'package:flutter/material.dart';
import 'package:shared_prefence/src/widgets/menu_widget.dart';

import '../share_pref/shared_helper.dart';

class HomePage extends StatelessWidget {


  static final String routeName = 'home';
  final SharedPreferencesHelper prefs = SharedPreferencesHelper();

   HomePage({Key? key}) : super(key: key){
     initSharedPreferencesHelper();
   }
  Future<void> initSharedPreferencesHelper() async {
    await prefs.init();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
       // backgroundColor: (prefs.getColorSecundario() ==  null) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${ prefs.getColorSecundario()}'),
          Divider(),
          Text('Género: ${ prefs.getGenero() }'),
          Divider(),
          Text('Nombre usuario: ${ prefs.getNombreUsuario() }'),
          Divider()
        ],
      ),
    );
  }

}
