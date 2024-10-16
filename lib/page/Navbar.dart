import 'package:flutter/material.dart';
import 'package:qrcode_scanner/page/qrcodeScanner.dart';
import 'package:qrcode_scanner/page/qrcode_generator.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Shebii.com"),
            accountEmail: Text("mshoaibsaeed.com"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "image/boy.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.qr_code_scanner_rounded),
            title: Text("Generate Qr"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrGenerator()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border_rounded),
            title: Text("Favourite"),
          )
        ],
      ),
    );
  }
}
