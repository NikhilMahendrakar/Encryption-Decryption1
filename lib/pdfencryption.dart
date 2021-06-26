import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:resume_app/my_encryption.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:encrypt/encrypt.dart' as enc;

class pdfencryption extends StatefulWidget {
  @override
  State<StatefulWidget> get createState => pdfencryptionstate();
}

class pdfencryptionstate extends State<pdfencryption> {
  var url =
      "https://upload.wikimedia.org/wikipedia/commons/4/4b/What_Is_URL.jpg";

  bool _isGranted = true;
  var filename = "MyEncrypted.jpg";
  Future<Directory> get getExternalVisibleDir async {
    if (await Directory('/storage/emulated/0/myEncFolder').exists()) {
      final externalDir = Directory('/storage/emulated/0/myEncFolder');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/myEncFolder')
          .create(recursive: true);
      final externalDir = Directory('/storage/emulated/0/myEncFolder');
      return externalDir;
    }
  }

  requestSoragePermission() async {
    if (!await Permission.storage.isGranted) {
      PermissionStatus result = await Permission.storage.request();
      if (result.isGranted) {
        setState(() {
          _isGranted = true;
        });
      } else {
        _isGranted = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    requestSoragePermission();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("Encryp&Download"),
                onPressed: () async {
                  if (_isGranted) {
                    Directory d = await getExternalVisibleDir;
                    _downloadandCreate(url, d, filename);
                  } else {
                    print("No Permission Granted.");
                    requestSoragePermission();
                  }
                }),
            RaisedButton(
                child: Text("Decrypt file"),
                onPressed: () async {
                  if (_isGranted) {
                    Directory d = await getExternalVisibleDir;
                    _getNormalfile(d, filename);
                  } else {
                    print("No permission granted..");
                    requestSoragePermission();
                  }
                })
          ],
        ),
      ),
    );
  }

  _downloadandCreate(String url, Directory d, filename) async {
    if (await canLaunch(url)) {
      print("Data Downloading");
      var resp = await http.get(url);
      var encResult = await _encryptData(resp.bodyBytes);
      String p = await _writeData(encResult, d.path + '/$filename.aes');
      print("File is Encrypted Successfully: $p");
    } else {
      print("Cannot access url");
    }
  }

  _getNormalfile(Directory d, filename) async {
    Uint8List encdata = await _readData(d.path + '/$filename.aes');
    var plaindata = await _decryptData(encdata);
    String p = await _writeData(plaindata, d.path + '/$filename');
    print("File decrypted Successfully : $p");
  }

  _encryptData(plainString) {
    print("Encrypting file...");
    final encrypted =
        MyEncrypt.myEncrypter.encryptBytes(plainString, iv: MyEncrypt.myIV);
    return encrypted.bytes;
  }

  _decryptData(encData) async {
    print("Final decryption in progress....");
    enc.Encrypted en = new enc.Encrypted(encData);
    return MyEncrypt.myEncrypter.decryptBytes(en, iv: MyEncrypt.myIV);
  }

  Future<Uint8List> _readData(fileNamewithPath) async {
    print("Reading Data.....");
    File f = File(fileNamewithPath);
    return await f.readAsBytes();
  }

  Future<String> _writeData(datatoWrite, fileNamewithPath) async {
    print("Writing Data....");
    File f = File(fileNamewithPath);
    await f.writeAsBytes(datatoWrite);
    return f.absolute.toString();
  }
}

class MyEncrypt {
  static final myKey = enc.Key.fromUtf8('TechWithNMTechWithNMTechWithNM12');
  static final myIV = enc.IV.fromUtf8('NikhilAnandM1122');
  static final myEncrypter = enc.Encrypter(enc.AES(myKey));
}
