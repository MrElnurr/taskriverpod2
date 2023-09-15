import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yeni_task_1409/providers/providers.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  var yoxlama =
                      ref.read(userProvider.notifier).ourData.toString();
                  debugPrint('$yoxlama');
                },
                icon: Icon(Icons.delete_sweep_outlined)),
          ],
          title: const Text('Material App Bar'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: ref.watch(userProvider).length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(ref.watch(userProvider)[index].id.toString()),
                title: Text(ref.watch(userProvider)[index].title),
                trailing: IconButton(
                    onPressed: () {
                      ref.read(userProvider.notifier).deleteItem(index);
                    },
                    icon: Icon(Icons.delete_rounded)),
              );
            },
          ),
        ),
      ),
    );
  }
}
