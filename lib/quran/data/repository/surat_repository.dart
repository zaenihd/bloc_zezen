import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_zezen/quran/data/model/surat_detail_model.dart';
import 'package:flutter_bloc_zezen/quran/data/model/surat_model.dart';

class SuratRepository {
  final dio = Dio();

  Future<dynamic> getAllSurat() async {
    try {
      final response = await dio.get('https://equran.id/api/v2/surat');
      final data = suratModelFromJson(response.toString());
      return data.data;
    } catch (e) {
      log("$e");
    }
  }

  Future<dynamic> getDetailSurat(int idSurat) async {
    try {
      final response = await dio.get('https://equran.id/api/v2/surat/$idSurat');
      final data = suratDetailModelFromJson(response.toString());
      return data.data;
    } catch (e) {
      log("$e");
    }
  }
}
