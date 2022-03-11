import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Tigo Form demo';

    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
        )),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Masculino';

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Valida que tus datos sean correctos'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        readOnly: true,
                        initialValue: 'E - 8 -8849349',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          filled: true,
                          labelText: 'Cédula de identidad',
                          hintText: 'E - 8 -8849349',
                        ),
                        // validator: (String? value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter some text';
                        //   }
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        readOnly: true,
                        initialValue: '15/Enero/1986',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Fecha de expiración',
                          hintText: '15/Enero/1986',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Nombres',
                          hintText: 'Miguel Angel',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Apellidos',
                          hintText: 'Bonilla Huete',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        readOnly: true,
                        initialValue: '15/Enero/1985',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Fecha de nacimiento',
                          hintText: '15/Enero/1985',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border:
                              Border.all(style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Masculino', 'Femenino', 'Otro']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: const Color.fromARGB(255, 54, 56, 83),
                      textStyle: const TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    // if (_formKey.currentState!.validate()) {
                    //   // Si el formulario es válido, queremos mostrar un Snackbar
                    //   Scaffold.of(context).showSnackBar(const SnackBar(
                    //       content: Text(
                    //     'Continuar',
                    //     style: TextStyle(color: Colors.white),
                    //   )));
                    // }
                  },
                  child: const Text('Finalizar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
