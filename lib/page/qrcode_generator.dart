import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  String qrdata = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Container(
            child: Text(
          "QR Generator",
          style: TextStyle(color: Colors.white),
        )),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            qrdata.isEmpty
                ? Text(
                    "Enter data to Generator QrCode",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                : QrImageView(
                    data: qrdata,
                    version: QrVersions.auto,
                    size: 200,
                  ),
            Padding(
              padding: EdgeInsets.all(28.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Data", border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    qrdata = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
