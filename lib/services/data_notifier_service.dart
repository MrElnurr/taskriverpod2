import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeni_task_1409/api.dart';

class DataNotifier extends StateNotifier<List<Users>> {
  DataNotifier() : super([]);
  List<Users> ourData = [];
  Future<List<Users>> getUsers() async {
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      var data = response.data;
      if (data is List) {
        List<Users> newData = data.map((e) => Users.fromJson(e)).toList();

        ourData = newData;
        return ourData;
      }
    }
    return ourData;
  }

  void reversedItems() {
    state = ourData.reversed.toList();
  }

  deleteItem(int index) {
    final itemList = ourData;
    itemList.removeAt(index);
    state = itemList;
    debugPrint('silindi $index');
    debugPrint('list ${ourData.length}');
  }

  void addItem() {}
}
