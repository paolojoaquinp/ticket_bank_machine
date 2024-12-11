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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Expanded(
          child: Column(
            children: [
              Container(height: MediaQuery.sizeOf(context).height * 0.1,color:  Colors.blue,),
              Expanded(
                child: PerspectiveListView(
                  visualizedItems: 4,
                  itemExtent: MediaQuery.sizeOf(context).height * .7,
                  initialIndex: 7,
                  backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.all(10),
                  onTapFrontItem: (value) {},
                  children: List.generate(
                    20,
                    (index) {
                      final borderColor = Colors.accents[index % Colors.accents.length];
                      return Card();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
