// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreenTugas10 extends StatelessWidget {
  final String nama, email, nomorhp, kotaasal;

  const HomeScreenTugas10({
    super.key,
    required this.nama,
    required this.email,
    required this.nomorhp,
    required this.kotaasal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(nama), Text(email), Text(nomorhp), Text(kotaasal)],
      ),
    );
  }
}
