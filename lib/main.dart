import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/scrollable_card_stack.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ScrollableCardStack(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Center(
                    child: Text('Card $index',
                        style: const TextStyle(
                            fontSize: 24, color: Colors.white))),
              ),
            );
          },
        ),
      ),
    );
  }
}
