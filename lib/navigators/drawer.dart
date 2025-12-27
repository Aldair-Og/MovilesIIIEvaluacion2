import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            title: const Text('Comentarios'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/comentarios');
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Series'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/series');
            },
          ),
        ],
      ),
    );
  }
}
