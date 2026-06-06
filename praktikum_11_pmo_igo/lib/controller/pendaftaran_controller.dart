import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:praktikum_11_pmo_igo/config/model_pendaftaran.dart';
import 'package:praktikum_11_pmo_igo/config/base_url.dart';

class PendaftaranController {
  Future<List<Pendaftaran>> getAllData() async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}pendaftaran'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
        },
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (decodedData is Map && decodedData.containsKey('data')) {
          final List<dynamic> listData = decodedData['data'];
          return listData.map((json) => Pendaftaran.fromJson(json)).toList();
        }
        if (decodedData is List) {
          return decodedData.map((json) => Pendaftaran.fromJson(json)).toList();
        }
        throw Exception('Format respon data tidak dikenali.');
      } else {
        throw Exception('Gagal memuat data. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

  Future<String?> createData(Pendaftaran data) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}pendaftaran'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
        },
        body: json.encode(data.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        if (errorResponse.containsKey('messages')) {
          return errorResponse['messages'].values.first.toString();
        }
        return "Gagal menyimpan data.";
      }
    } catch (e) {
      return "Terjadi kesalahan jaringan: $e";
    }
  }

  Future<String?> updateData(String id, Pendaftaran data) async {
    try {
      final response = await http.put(
        Uri.parse('${baseUrl}pendaftaran/$id'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
        },
        body: json.encode({
          "nama": data.nama,
          "email": data.email,
          "no_telepon": data.noTelepon,
          "jenis_kelamin": data.jenisKelamin,
          "bahasa": data.bahasa,
          "agama": data.agama,
          "tanggal_daftar": data.tanggalDaftar,
          "jam_daftar": data.jamDaftar,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        if (errorResponse.containsKey('messages')) {
          return errorResponse['messages'].values.first.toString();
        }
        return "Gagal memperbarui data.";
      }
    } catch (e) {
      return "Terjadi kesalahan jaringan: $e";
    }
  }

  Future<bool> deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${baseUrl}pendaftaran/$id'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "ngrok-skip-browser-warning": "true",
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error Delete: $e');
      return false;
    }
  }
}
