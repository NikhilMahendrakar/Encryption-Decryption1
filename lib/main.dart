import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:resume_app/my_encryption.dart';
import 'package:resume_app/pdfencryption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      color: Colors.black,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> get createState => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  var encryptedtext, plaintext, encryptedtext2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption/Decryption"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: textEditingController,
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Enter your text for Encryption'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    plaintext = textEditingController.text;
                    setState(() {
                      encryptedtext =
                          MyEncryptionDecryption.encryptAES(plaintext);
                    });
                    showDialog(
                        context: context,
                        builder: (ctxt) => new AlertDialog(
                              title: Text('Your Encrypted String'),
                              content: Text(encryptedtext == null
                                  ? ""
                                  : encryptedtext is encrypt.Encrypted
                                      ? encryptedtext.base64
                                      : encryptedtext),
                            ));
                  },
                  child: Text("Encrypt"),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(encryptedtext == null
                      ? ""
                      : encryptedtext is encrypt.Encrypted
                          ? encryptedtext.base64
                          : encryptedtext),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  encryptedtext =
                      MyEncryptionDecryption.decryptAES(encryptedtext);
                });
              },
              child: Text("Decrypt"),
            ),
            Column(
              children: [
                Text(
                    "If you have Large Text convert it into pdf and click Here->"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pdfencryption()));
                    },
                    child: Text("EncryptPDFfiles"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
