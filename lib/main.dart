import 'package:flutter/material.dart';

void main() => runApp(DanaApp());

class DanaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppMaster Romero',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IngresoSistema(),
    ); //Fin MaterialApp
  } //Fin Widget
} //Fin de La clase DanaApp

class IngresoSistema extends StatefulWidget {
  @override
  _IngresoSistemaState createState() => _IngresoSistemaState();
} //Fin IngresoSistema

class _IngresoSistemaState extends State<IngresoSistema> {
  bool acceso = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text('Ingreso al Sistema Romero'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bluetooth,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ], //Fin de Action Widget
      ), //Fin Appbar
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/app.gif'),
                SizedBox(height: 16.0),
              ],
            ), //Fin de Columna
            if (!acceso)
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: Colors.amber,
                      labelText: 'Ingresa Nombre Usuario',
                      icon: Icon(Icons.edit_rounded, color: Colors.indigo),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ), //Fin Text Field
                  SizedBox(height: 12.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa tu Contraseña',
                      icon: Icon(Icons.lock, color: Colors.indigo),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                    obscureText: true,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            setState(() {
                              acceso = false;
                            });
                          },
                        ), //Fin FlatButton
                        RaisedButton(
                          child: Text(
                            'Siguiente',
                          ),
                           color: Colors.greenAccent[200],
                           splashColor: Colors.cyan,
                          animationDuration: Duration(seconds: 20),
                           padding: EdgeInsets.all(20.0),
                          colorBrightness: Brightness.light,
                          onPressed: () {
                            setState(() {
                              acceso = true;
                            });
                          },
                        ), //Fin Raised Button
                      ], //Fin niños Widget
                    ), //Fin de Niño Row
                  ) //Fin De Padding
                ], //Fin Widget[]
              ) //Fin Columna
            else
              Center(
                child: Column(
                  children: <Widget>[
                    Text('Estas Conectado!'),
                    RaisedButton(
                      elevation: 20.0,
                      child: Text('Cerrar Sesión'),
                      onPressed: () {
                        setState(() {
                          acceso = false;
                        });
                      },
                    ) //Fin Boton Sobresaliente
                  ], //Fin Niños Widget
                ),
              ) //If Falso
          ], //Fin Widgets
        ), //Fin ListView
      ), //Fin de Body Area segura
    ); //Fin Scaffold
  } //Fin Widget
} //Fin cLASE Ingreso Sistema
