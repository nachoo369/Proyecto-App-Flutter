import 'package:flutter/material.dart';
//INTEGRANTES: Diego Gallegos, Ignacio Riffo
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomWidget(),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool rememberMe = false;
  final _emailController = TextEditingController();//restricciones
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); //
  bool _isButtonEnabled = false; //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo de entrada para el correo electrónico
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.blue),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(hintText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, ingresa un correo electrónico';
                                } else if (!value.contains('@')) {
                                  return 'El correo electrónico no es válido';
                                }
                                return null;
                              },
                              onChanged: (_) {
                                // Actualiza el estado del botón según la validación
                                setState(() {
                                  _isButtonEnabled = _formKey.currentState!.validate();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Campo de entrada para la contraseña
                      Row(
                        children: [
                          Icon(Icons.lock, color: Colors.blue),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(hintText: 'Contraseña'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, ingresa una contraseña';
                                }
                                return null;
                              },
                              onChanged: (_) {
                                // Actualiza el estado del botón según la validación
                                setState(() {
                                  _isButtonEnabled = _formKey.currentState!.validate();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              Text('Recordarme'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Acción para olvidar la contraseña
                            },
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isButtonEnabled
                            ? () {
                          // Validar el formulario antes de redirigir
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          }
                        }
                            : null, // Deshabilita el botón si no es válido
                        child: Text('Iniciar Sesión'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Home', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}