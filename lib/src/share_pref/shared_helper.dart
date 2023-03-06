import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {

  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Genero
  int getGenero() {
    return _preferences.getInt('genero') ?? 1;
  }

  Future<bool> setGenero(int value) {
    return _preferences.setInt('genero', value);
  }

  // Color secundario
  bool getColorSecundario() {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  Future<bool> setColorSecundario(bool value) {
    return _preferences.setBool('colorSecundario', value);
  }

  // Nombre de usuario
  String getNombreUsuario() {
    return _preferences.getString('nombreUsuario') ?? '';
  }

  Future<bool> setNombreUsuario(String value) {
    return _preferences.setString('nombreUsuario', value);
  }

  // Última página
  String getUltimaPagina() {
    return _preferences.getString('ultimaPagina') ?? 'home';
  }

  Future<bool> setUltimaPagina(String value) {
    return _preferences.setString('ultimaPagina', value);
  }

}