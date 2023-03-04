import 'package:flutter/material.dart';
import 'package:shared_prefence/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName="settings";

  SettingsPage({required Key key}) : super(key: key);

  @override
  _SettingsPageState createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
       // backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}