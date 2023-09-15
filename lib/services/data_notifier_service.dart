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
        //  state = data.map((e) => Users.fromJson(e)).toList();
        ourData = newData;
        // state = newData;
        return ourData;
        // return [...state];
      }
    }
    return ourData;
    // return [...state];
  }

  reversedItems() {
    state = ourData;
    state = state.reversed.toList();
    return [...state];
  }

  deleteItem(int index) {
    final itemList = ourData;
    itemList.removeAt(index);
    state = itemList;
    debugPrint('silindi $index');
    debugPrint('list ${ourData.length}');
    return [...state];
  }

  void addItem() {}
}
