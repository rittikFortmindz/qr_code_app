import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_app/scan.dart';
import 'package:qr_code_app/widget/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("QR Genarator"),
        ),
        body: Column(
          children: [
            Container(
              height: 30,
              child: Text("Scan the qr"),
            ),
            QrWidget(
              data: "this dumy data",
            ),
            Container(
              padding: EdgeInsets.all(8), // Border width
              decoration: const BoxDecoration(
                  // color: Colors.red, shape: BoxShape.circle

                  ),
              // child: ClipOval(
              //   child: SizedBox.fromSize(
              //     size: Size.fromRadius(48), // Image radius
              //     child: Image.asset(
              //       'assets/images/qr_code.png', height: 10,
              //       // color: Colors.black,
              //     ),
              //   ),
              // ),
              child: Container(
                  child: CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ScanQr()));
                      },
                      child: Text("Scan"))),
            )
          ],
        ));
  }
}
