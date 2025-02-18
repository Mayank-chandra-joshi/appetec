import 'package:appetec/core/common/snackbar/custom_snackbar.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/onboarding/data/repositories/device_repository_impl.dart';
import 'package:appetec/features/onboarding/data/sources/device_remote_source.dart';
import 'package:appetec/features/onboarding/domain/entities/device.dart';
import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:appetec/features/onboarding/domain/usecases/get_devices.dart';
import 'package:appetec/core/utils/degreeToRadians.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/features/onboarding/presentation/widgets/cards/device_card.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SelectDevicePage extends StatefulWidget {
  SelectDevicePage({super.key});

  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  final String username = "Mayank";
  String? selectedDeviceId;
  String? selectedDeviceImg;
  bool isShowLoader = false;

  final PagingController<int, Device> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      fetchDevices(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void selectDevice(String id, String imgUrl) {
    setState(() {
      selectedDeviceId = selectedDeviceId == id ? null : id;
      selectedDeviceImg = selectedDeviceImg == imgUrl ? null : imgUrl;
    });
  }

  void fetchDevices(int page) async {
    try {
      final response = await GetDevices(
        DeviceRepositoryImpl(deviceRemoteSource: DeviceRemoteSourceImp()),
      ).call(page);

      response.fold((l) {
        throw l.message;
      }, (r) {
        final isLastPage = r.currentDevicesCount == 0;
        if (isLastPage) {
          _pagingController.appendLastPage(r.devices);
          setState(() {
            isShowLoader = false;
          });
        } else {
          final nextPageKey = page + 1;
          _pagingController.appendPage(r.devices, nextPageKey);
          setState(() {
            isShowLoader = true;
          });
        }
      });
    } catch (e) {
      _pagingController.error = e;
    }
  }

  void navigateToNextPage() {
    if (selectedDeviceId == null ||
        selectedDeviceId!.isEmpty ||
        selectedDeviceImg == null ||
        selectedDeviceImg!.isEmpty) {
      customSnackbar(context, "Please select a device", redColor, white);
      return;
    }

    context.read<OnboardingBloc>().add(
          UpdateOnboardingSelectedDeviceEvent(
            deviceMetaData: DeviceMetaData(
              deviceImg: selectedDeviceImg as String,
              serialId: selectedDeviceId as String,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingSelectedDeviceUpdate) {
              context.pushNamed(AppRouteConstants.ADD_DEVICE,
                  pathParameters: {'id': selectedDeviceId as String});
            }
          },
          child: Stack(children: [
            Container(
              color: darkGreen,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 100, 16, 48),
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
                            "Pair your device for customized recommendations.",
                            style: GoogleFonts.exo(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: PagedListView<int, Device>(
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Device>(
                        firstPageProgressIndicatorBuilder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        newPageProgressIndicatorBuilder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        itemBuilder: (context, device, index) {
                          Device? nextDevice =
                              index + 1 < _pagingController.itemList!.length
                                  ? _pagingController.itemList![index + 1]
                                  : null;
                          if (index % 2 == 0) {
                            return Column(
                              children: [
                                Row(
                                  spacing: 32,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          64,
                                      child: DeviceCard(
                                        deviceDetails: device,
                                        isSelected:
                                            selectedDeviceId == device.id,
                                        selectDevice: selectDevice,
                                      ),
                                    ),
                                    if (nextDevice != null)
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                64,
                                        child: DeviceCard(
                                          deviceDetails: nextDevice,
                                          isSelected:
                                              selectedDeviceId == nextDevice.id,
                                          selectDevice: selectDevice,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  )),
                  const SizedBox(height: 16),
                  Container(
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    padding: const EdgeInsets.fromLTRB(48, 40, 48, 64),
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
                          onPressed: navigateToNextPage,
                          width: 120,
                          color: white,
                          bgcolor: primaryPurple,
                          frcolor: lightPurple,
                        ),
                      ],
                    ),
                  ),
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
                ),
              ),
            ),
            Positioned(
              bottom: 115,
              left: -30,
              child: Image.asset(
                "assets/images/Group 418.png",
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ])),
    );
  }
}
