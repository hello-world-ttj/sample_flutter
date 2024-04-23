import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[100],
        onPressed: () => showSheet(context),
        child: const Icon(
          Icons.add,
          color: Colors.blue,
          size: 50,
        ),
      ),
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: count,
                  builder: (BuildContext context, int newValue, child) {
                    return Text('$newValue');
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    _increment();
                  },
                  icon: const Icon(Icons.plus_one),
                  label: const Text("Increment"))
            ],
          ),
        ),
      ),
    );
  }

  showSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Title"),
                    IconButton.filled(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        icon: Icon(Icons.close))
                  ],
                )
              ],
            ),
          );
        });
  }

  _increment() {
    count.value = count.value + 1;
    print(count);
  }
}
