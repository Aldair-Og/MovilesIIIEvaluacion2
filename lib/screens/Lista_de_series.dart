import 'dart:convert';
import 'package:flutter/material.dart';
import '/navigators/drawer.dart';
import 'package:flutter/services.dart' show rootBundle;

class ListaScreen extends StatefulWidget {
  const ListaScreen({super.key});

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  List<dynamic> series = [];

  @override
  void initState() {
    super.initState();
    cargarSeries();
  }

  Future<void> cargarSeries() async {
    final String response = await rootBundle.loadString('assets/data/series.json');
    final data = json.decode(response);
    setState(() {
      series = data['series'];
    });
  }

  void mostrarInfoSerie(Map<String, dynamic> serie) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(serie['titulo']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(serie['info']['imagen']),
            const SizedBox(height: 10),
            Text(serie['descripcion']),
            const SizedBox(height: 10),
            Text('Año: ${serie['anio']}'),
            Text('Temporadas: ${serie['metadata']['temporadas']}'),
            Text('Creador: ${serie['metadata']['creador']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ver más'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Series')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: series.length,
        itemBuilder: (context, index) {
          final serie = series[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.network(
                serie['info']['imagen'],
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(serie['titulo']),
              subtitle: Text(
                serie['descripcion'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => mostrarInfoSerie(serie),
            ),
          );
        },
      ),
    );
  }
}
