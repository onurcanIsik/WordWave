// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import '../../core/model/data_model.dart';

class DatasService {
  Future<List<Datas>> allData() async {
    final jsonData = await rootBundle.loadString('assets/json/data.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Datas.fromJson(e)).toList();
  }

  String getRandomTitle(List<Datas> data) {
    final random = Random();
    final randomIndex = random.nextInt(data.length);
    return data[randomIndex].title;
  }

  String getRandomName(List<Datas> data, String selectedTitle) {
    final selectedData = data.firstWhere((item) => item.title == selectedTitle);
    final namesList = selectedData.names;
    final random = Random();
    final randomIndex = random.nextInt(namesList.length);
    final randomName = namesList[randomIndex];

    return randomName;
  }

  startCountdown(int seconds, int value) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      value = seconds;

      seconds--;

      if (seconds < 0) {
        timer.cancel();
      }
    });
  }
}
