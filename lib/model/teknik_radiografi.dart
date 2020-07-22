import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String id;
  String name;
  String kategori;
  String urlGambar;
  String CP;
  String CR;
  String FFD;
  String Kaset;
  String Kriteria_Gambar;
  String Marker;
  String PO;
  String PP;


//  List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    kategori = data['kategori'];
    urlGambar = data['urlGambar'];
    CP = data['CP'];
    CR = data['CR'];
    FFD = data['FFD'];
    Kaset = data['Kaset'];
    Kriteria_Gambar = data['Kriteria Gambar'];
    Marker = data['Marker'];
    PO = data['PO'];
    PP = data['PP'];
//    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kategori': kategori,
      'urlGambar': urlGambar,
      'CP' : CP,
      'CR' : CR,
      'FFD' : FFD,
      'Kaset' : Kaset,
      'Kriteria Gambar' : Kriteria_Gambar,
      'Marker' : Marker,
      'PO' : PO,
      'PP' : PP,

//      'subIngredients': subIngredients,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
