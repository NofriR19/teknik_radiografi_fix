import 'package:teknikradiografi/api/teknikradiografi_api.dart';
import 'package:teknikradiografi/model/teknik_radiografi.dart';
import 'package:teknikradiografi/notifier/teknikradiografi_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teknikradiografi_form.dart';

class about_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[

                SizedBox(height: 24),
                Text(
                  'Teknik Radiografi Apps Mobile',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Made by Nofri Rhamawati && Amathyas Dimas Sthy Danu ',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 22),
                Text(
                  'Ini adalah aplikasi berbasis mobile yang bertujuan memudahkan para radiografer dalam membaca buku panduan teknik radiografi',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Dibuat pada : Juli 2020',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Thanks to our parents '
                  'Allah SWT',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'More Info :',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'No HP : 089506960166',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Instagram : @nofri_r19',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Email : @nofri.rhamawati19@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
