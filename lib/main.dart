import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week04 Widget Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;
  final List<String> _logs = [];

  void _increment() {
    setState(() {
      _count++;
      _logs.add('카운트 증가: $_count');
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
      _logs.add('카운트 초기화');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // [검증] Scaffold 및 AppBar 사용
      appBar: AppBar(
        title: const Text('4주차 위젯 조합 화면'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // [검증] Column 배치 위젯 사용
        child: Column(
          children: [
            // [검증] Row 배치 위젯 & Text, Icon 보여 주기 위젯 사용
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.touch_app, size: 30, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  '현재 클릭 수: $_count',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // [검증] Row 배치 위젯 & ElevatedButton, IconButton 동작 위젯 사용
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('증가'),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  tooltip: '초기화',
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              '동작 기록 목록',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // [검증] ListView 배치 위젯 사용
            Expanded(
              child: _logs.isEmpty
                  ? const Center(child: Text('기록이 없습니다.'))
                  : ListView.builder(
                      itemCount: _logs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.history),
                            title: Text(_logs[index]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}