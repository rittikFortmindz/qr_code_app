import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrWidget extends StatelessWidget {
  var data;
  QrWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      // backgroundColor: Colors.blue,
      padding: EdgeInsets.all(28),
      gapless: true,
      data: data,
      version: QrVersions.auto,
      dataModuleStyle: const QrDataModuleStyle(
          color: Colors.black, dataModuleShape: QrDataModuleShape.square),
      eyeStyle:
          const QrEyeStyle(color: Colors.black, eyeShape: QrEyeShape.square),

      // size: 300.0,
      // embeddedImage: const AssetImage('assets/images/images.jpg'),
      errorStateBuilder: (cxt, err) {
        return const Center(
          child: Text(
            'Something went wrong...',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
