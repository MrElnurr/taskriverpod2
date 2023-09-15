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
          body: FutureBuilder(
            future: ref.read(userProvider.notifier).getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // ignore: avoid_print
                print(snapshot.error.toString());
                return Container();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(snapshot.data![index].id.toString()),
                      title: Text(snapshot.data![index].title),
                      trailing: IconButton(
                          onPressed: () {
                            ref.watch(userProvider.notifier).deleteItem(index);
                          },
                          icon: Icon(Icons.delete_rounded)),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
