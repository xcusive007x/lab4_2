import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Return Data',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _city = 'ยังไม่เลือก';

  Future<void> _pick() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const CityPage()),
    );
    
    if (result != null && mounted) {
      setState(() => _city = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('หน้าหลัก')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pick,
          child: Text('เมืองที่เลือก: $_city', style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cities = ['ลำปาง', 'ลำพูน', 'กรุงเทพ', 'เชียงใหม่', 'ภูเก็ต', 'ขอนแก่น'];

    return Scaffold(
      appBar: AppBar(title: const Text('เลือกเมือง')),
      body: ListView(
        children: cities.map((c) => ListTile(
          title: Text(c),
          onTap: () => Navigator.pop(context, c), 
        )).toList(),
      ),
    );
  }
}