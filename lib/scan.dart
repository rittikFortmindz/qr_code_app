import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qr_code_app/result.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String text = "";
  late QRCodeDartScanController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller here
    _controller = QRCodeDartScanController();
  }

  @override
  void dispose() {
    _controller.stopScan();
    // _controller.dispose(); // Stop scanning when disposing the screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (dynamic? progress) {
        // return Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 50,
        //     ),
        //     if (progress != null) Text(progress)
        //   ],
        // );

        return Center(
          child: Container(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              color: Colors.grey,
              size: 50,
            ),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Scan"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 160),
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.02),
                  backgroundBlendMode: BlendMode.darken,
                  // color: const Color.fromARGB(0, 53, 52, 52).withOpacity(0.3),
                  // border: Border.all(width: 5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 40,
                          height: 5,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 5,
                          height: 40,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 5,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 5,
                          height: 40,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 40,
                          height: 5,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 5,
                          height: 40,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 5,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 5,
                          height: 40,
                          color: Colors.red,
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.bottomCenter,
                      //   width: double.infinity,
                      //   height: 2,
                      //   color: Colors.red,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: QRCodeDartScanView(
                            widthPreview: 220,
                            heightPreview: 220,
                            controller: _controller,
                            intervalScan: Duration(seconds: 1),
                            scanInvertedQRCode:
                                true, // enable scan invert qr code ( default = false)
                            formats: const [BarcodeFormat.qrCode],
                            typeScan: TypeScan
                                .live, // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)
                            // intervalScan: const Duration(seconds:1)
                            // onResultInterceptor: (old,new){
                            //  do any rule to controll onCapture.
                            // }
                            // takePictureButtonBuilder: (context, controller, isLoading) {
                            //   // if typeScan == TypeScan.takePicture you can customize the button.
                            //   if (isLoading) return CircularProgressIndicator();
                            //   return ElevatedButton(
                            //     onPressed: controller.takePictureAndDecode,
                            //     child: Text('Take a picture'),
                            //   );
                            // },
                            resolutionPreset:
                                QRCodeDartScanResolutionPreset.ultraHigh,
                            // resolutionPreset: = QrCodeDartScanResolutionPreset.high,
                            // formats: [ // You can restrict specific formats.
                            //  BarcodeFormat.qrCode,
                            //  BarcodeFormat.aztec,
                            //  BarcodeFormat.dataMatrix,
                            //  BarcodeFormat.pdf417,
                            //  BarcodeFormat.code39,
                            //  BarcodeFormat.code93,
                            //  BarcodeFormat.code128,
                            //  BarcodeFormat.ean8,
                            //  BarcodeFormat.ean13,
                            // ],
                            onCapture: (Result result) async {
                              context.loaderOverlay.show();
                              await _controller?.stopImageStream();
                              await _controller.stopScan();

                              await Future.delayed(Duration(seconds: 1));
                              context.loaderOverlay.hide();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultPage(text: result.text)));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
