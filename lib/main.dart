import 'package:evaluacion2/screens/Comentarios.dart';
import 'package:evaluacion2/screens/Lista_de_series.dart';
import 'package:evaluacion2/screens/Registro.dart';
import 'package:evaluacion2/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gtkoafljuibwidvyllrv.supabase.co',
    anonKey: 'sb_publishable_DAlg9QlULc8WpGnoD-VbeQ_z_1QWMSZ',
  );

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioSesion(),
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/comentarios': (context) => const ComentariosScreen(),
        '/series': (context) => const ListaScreen(),
      },
    );
  }
}

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Iniciar sesión'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
