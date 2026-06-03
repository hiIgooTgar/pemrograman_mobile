import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:praktikum_11_pmo_igo/config/model_pendaftaran.dart';
import 'package:praktikum_11_pmo_igo/config/base_url.dart';

class PendaftaranController {
  Future<List<Pendaftaran>> getAllData() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}pendaftaran'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => Pendaftaran.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

  Future<bool> createData(Pendaftaran data) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}pendaftaran'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data.toJson()),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint('Error Create: $e');
      return false;
    }
  }

  Future<bool> updateData(String id, Pendaftaran data) async {
    try {
      final response = await http.put(
        Uri.parse('${baseUrl}pendaftaran/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error Update: $e');
      return false;
    }
  }

  Future<bool> deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${baseUrl}pendaftaran/$id'),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error Delete: $e');
      return false;
    }
  }
}
