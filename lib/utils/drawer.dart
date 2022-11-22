import 'package:flutter/material.dart';

Drawer buildDrawer(BuildContext context) {
  String? route = ModalRoute.of(context)?.settings.name;

  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Counter hii'),
          onTap: () {
            // Route menu ke counter
            if (route == '/') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            if (route == '/form-budget') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/form-budget');
            }
            // Route menu ke tambah budget
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            if (route == '/data-budget') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/data-budget');
            }
            // Route menu ke data budget
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            if (route == '/my-watchlist') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/my-watchlist');
            }
            // Route menu ke data budget
          },
        ),
      ],
    ),
  );
}
