import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrcode_scanner/page/Navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String result = " ";

  Future<void> scanQrcode() async {
    String barcodeRes;
    try {
      barcodeRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      setState(() {
        if (barcodeRes != null) {
          result = barcodeRes;
        }
      });
    } on PlatformException {
      barcodeRes = 'Failed to get platform version';
    }
  }

  Future<void> scanbarcode() async {
    String barcodeRes;
    try {
      barcodeRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      setState(() {
        if (barcodeRes != null) {
          result = barcodeRes;
        }
      });
    } on PlatformException {
      barcodeRes = 'Failed to get platform version';
    }
  }

  Future<void> _launchUrl() async {
    await launchUrl(Uri.parse(result));
  }

  _copy() {
    final value = ClipboardData(text: result);
    Clipboard.setData(value);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Url i Copied")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text(
            "QR Code",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                result,
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _launchUrl,
                        child: const Icon(
                          Icons.open_in_browser_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      Text(
                        "Open",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _copy,
                        child: Icon(
                          Icons.content_paste_outlined,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                      Text(
                        "Copy",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        scanQrcode();
                      },
                      child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Scan QR Code",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        scanbarcode();
                      },
                      child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "BarCode Scaner",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
