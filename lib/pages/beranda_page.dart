import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text('Enam Pilar Smart City'),

          SizedBox(height: 20),

          Card(child: ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Smart Governance'),
          )),

          Card(child: ListTile(
            leading: Icon(Icons.campaign),
            title: Text('Smart Branding'),
          )),

          Card(child: ListTile(
            leading: Icon(Icons.business),
            title: Text('Smart Economy'),
          )),

          Card(child: ListTile(
            leading: Icon(Icons.home),
            title: Text('Smart Living'),
          )),

          Card(child: ListTile(
            leading: Icon(Icons.people),
            title: Text('Smart Society'),
          )),

          Card(child: ListTile(
            leading: Icon(Icons.eco),
            title: Text('Smart Environment'),
          )),
        ],
      ),
    );
  }
}