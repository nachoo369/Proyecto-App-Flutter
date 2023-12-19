import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Fondo verde
      body: CarouselSlider(
        items: [
          Container(
            color: Colors.green, // Fondo verde
            child: Image.asset('assets/images/carr1.png', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.green, // Fondo verde
            child: Image.asset('assets/images/carr2.png', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.green, // Fondo verde
            child: Image.asset('assets/images/carr3.png', fit: BoxFit.cover),
          ),
        ],
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            // Puedes agregar lógica cuando cambias de página en el carrusel
            if (index == 2) {
              // Agrega un retraso de 2 segundos antes de navegar a la nueva pantalla
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              });
            }
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Fondo verde
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo arriba de los botones
          Image.asset('assets/images/logo.png', width: 100, height: 100),
          SizedBox(height: 20),
          Text(
            'Ya estás listo!\nDebes tener una cuenta para usar los servicios.',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón "Iniciar Sesión"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Fondo negro
                onPrimary: Colors.white, // Texto blanco
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón "Registrarse"
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Fondo negro
                onPrimary: Colors.white, // Texto blanco
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'Registrarse',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '¿Eres doctor?',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Center(
            child: OutlinedButton(
              onPressed: () {
                // Acción al presionar el botón "Ingresar como Profesional"
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white), // Borde blanco
                primary: Colors.black, // Fondo negro
                onSurface: Colors.white, // Texto blanco
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'Ingresar como Doctor',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              // Agrega validación según tus requisitos
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              // Agrega validación según tus requisitos
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón "Iniciar Sesión"
              },
              child: Text('Iniciar Sesión'),
            ),
            OutlinedButton(
              onPressed: () {
                // Acción al presionar el botón "Olvidaste tu contraseña?"
              },
              child: Text('Olvidaste tu contraseña?'),
            ),
          ],
        ),
      ),
    );
  }
}
