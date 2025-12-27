import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/navigators/drawer.dart';

class ComentariosScreen extends StatelessWidget {
  const ComentariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comentarios')),
      drawer: const AppDrawer(),
      body: comentarioForm(context),
    );
  }
}

Widget comentarioForm(BuildContext context) {
  final TextEditingController serieController = TextEditingController();
  final TextEditingController comentarioController = TextEditingController();
  final supabase = Supabase.instance.client;

  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: serieController,
          decoration: const InputDecoration(labelText: 'Serie'),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: comentarioController,
          decoration: const InputDecoration(labelText: 'Comentario'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => guardarComentario(
            context,
            supabase,
            serieController,
            comentarioController,
          ),
          child: const Text('Guardar comentario'),
        ),
      ],
    ),
  );
}

Future<void> guardarComentario(
  BuildContext context,
  SupabaseClient supabase,
  TextEditingController serieController,
  TextEditingController comentarioController,
) async {
  try {
    await supabase
        .from('comentarios')
        .insert({
          'serie': serieController.text.trim(),
          'comentario': comentarioController.text.trim(),
        });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comentario guardado exitosamente'),
        backgroundColor: Colors.green,
      ),
    );

    serieController.clear();
    comentarioController.clear();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al guardar: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
