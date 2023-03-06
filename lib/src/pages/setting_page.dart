import 'package:flutter/material.dart';
import 'package:shared_prefence/src/widgets/menu_widget.dart';

import '../share_pref/shared_helper.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName="settings";


  SettingsPage({required Key key}) : super(key: key);

  @override
  _SettingsPageState createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _textController;
  late SharedPreferencesHelper prefs;
  late bool _colorSecundario;
  late int? _genero;
  late String _nombre;

  @override
  void initState() {
    super.initState();
    initSharedPreferencesHelper();
    prefs.setUltimaPagina(SettingsPage.routeName);

    _genero = prefs.getGenero();
    _colorSecundario = prefs.getColorSecundario();
    _textController = new TextEditingController(text: prefs.getNombreUsuario());
  }

  Future<void> initSharedPreferencesHelper() async {
    prefs = SharedPreferencesHelper();
    await prefs.init();
    setState(() {}); // redibuja el widget después de la inicialización
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

       // backgroundColor: (prefs.getColorSecundario()) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold )),
          ),

          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: ( value ){
              setState(() {
                _colorSecundario = value;
                prefs.setColorSecundario(value);
              });
            },
          ),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: ( value ) {
                prefs.setNombreUsuario(value);
              },
            ),
          )
        ],
      )
    );

  }


  _setSelectedRadio(int? valor){
    setState(() {
      _genero = valor;
    });

    prefs.setGenero(valor!);
  }
}