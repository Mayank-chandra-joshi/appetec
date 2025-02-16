import 'package:appetec/core/constants/backend/url.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/onboarding/data/repositories/device_repository_impl.dart';
import 'package:appetec/features/onboarding/data/sources/device_remote_source.dart';
import 'package:appetec/features/onboarding/domain/usecases/get_devices.dart';
import 'package:appetec/types/Device/DeviceDetails.dart';
import 'package:appetec/utils/degreeToRadians.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/core/common/cards/device_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDevicePage extends StatelessWidget {
  final username = "Mayank";
  static List<DeviceItem> items = [
    DeviceItem(id: "1", name: "Belt"),
    DeviceItem(id: "2", name: "Belt"),
    DeviceItem(id: "3", name: "Mark"),
    DeviceItem(id: "4", name: "Mark"),
    DeviceItem(id: "5", name: "Mark"),
    DeviceItem(id: "6", name: "Mark"),
  ];

  void fetchDevices(BuildContext context) async {
    try {
      final response = await GetDevices(
              DeviceRepositoryImpl(deviceRemoteSource: DeviceRemoteSourceImp()))
          .call();
      response.fold((l) => print(l.message), (r) => print(r));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  const SelectDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Expanded(
          child: Stack(children: [
            Container(
              color: darkGreen,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 100, 16, 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select a Device",
                          style: GoogleFonts.exo(
                            fontSize: 32,
                            color: white,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .68,
                          ),
                          child: Text(
                            "Pair your device for customised recommendation.",
                            style: GoogleFonts.exo(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 32,
                          crossAxisSpacing: 40,
                        ),
                        itemCount: items.length,
                        padding: EdgeInsets.symmetric(horizontal: 48),
                        itemBuilder: (context, index) {
                          return DeviceCard(deviceDetails: items[index]);
                        }),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    padding: EdgeInsets.fromLTRB(48, 40, 48, 64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimpleBtn(
                          text: "Back",
                          onPressed: () {
                            context.pop();
                          },
                          width: 120,
                          color: white,
                          bgcolor: primaryPurple,
                          frcolor: lightPurple,
                        ),
                        SimpleBtn(
                          text: "Next",
                          onPressed: () {
                            fetchDevices(context);
                          },
                          width: 120,
                          color: white,
                          bgcolor: primaryPurple,
                          frcolor: lightPurple,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -50,
              right: -50,
              child: Transform.rotate(
                  angle: degreeToRadians(10),
                  child: Image.asset(
                    "assets/images/Group 417.png",
                    height: 250,
                  )),
            ),
            Positioned(
              bottom: 115,
              left: -30,
              child: Image.asset(
                "assets/images/Group 418.png",
                height: 75,
                fit: BoxFit.cover,
              ),
            )
          ]),
        ));
  }
}
