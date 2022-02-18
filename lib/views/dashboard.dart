import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:futsal_app/controllers/dashboard_c.dart';
import 'package:futsal_app/routes/routes_name.dart';
import 'package:futsal_app/utils/app_text.dart';
import 'package:futsal_app/views/detail.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dashboardC = Get.find<DashboardC>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: Icon(
                      FontAwesomeIcons.userAlt,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.labelMontsW500(
                        "Anonime",
                        16,
                        Colors.black,
                      ),
                      AppText.labelMonts(
                        "Babelan, Bekasi Utara",
                        14,
                        Colors.grey,
                      )
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.square_grid_2x2_fill,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Center(
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      semanticContainer: true,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: Get.width / 1.14,
                        height: 84,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    semanticContainer: true,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: Get.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.labelMontsW500(
                                  "Ga punya lawan?",
                                  16,
                                  Colors.black,
                                ),
                                AppText.labelMontsW500(
                                  "Ajak tim lain untuk sparing disini..!",
                                  14,
                                  Colors.grey.shade400,
                                )
                              ],
                            ),
                            const Icon(
                              FontAwesomeIcons.teamspeak,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _dashboardC.streamLapangan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _dashboardC.saveLapangan(snapshot.data!.docs);
                      return ListView(
                        children: List.generate(
                          _dashboardC.listCategory.length,
                          (i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.labelMontsW500(
                                _dashboardC.listCategory[i] == 1
                                    ? "Badminton"
                                    : _dashboardC.listCategory[i] == 2
                                        ? "Futsal"
                                        : "Others",
                                14,
                                Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: Get.size.width,
                                height: Get.size.height / 4,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      _dashboardC.listLapangan
                                          .where((e) =>
                                              e.category ==
                                              _dashboardC.listCategory[i])
                                          .toList()
                                          .length, (index) {
                                    final _data = _dashboardC.listLapangan
                                        .where((e) =>
                                            e.category ==
                                            _dashboardC.listCategory[i])
                                        .toList()[index];
                                    return Card(
                                      elevation: 2,
                                      color: Colors.white,
                                      semanticContainer: true,
                                      clipBehavior: Clip.hardEdge,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            AppRoutesName.detail,
                                            arguments: [
                                              _data,
                                            ],
                                          );
                                        },
                                        child: SizedBox(
                                          width: Get.size.width / 2.2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: SizedBox(
                                                  width: Get.size.width / 2.2,
                                                  child: Hero(
                                                    tag: _data.image![0],
                                                    child: Image.network(
                                                      _data.image![0],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          AppText
                                                              .labelMontsW500(
                                                            _data.name!,
                                                            14,
                                                            Colors.black,
                                                          ),
                                                          AppText.labelMonts(
                                                            "Lapangan ${_data.lapangan!}",
                                                            12,
                                                            Colors
                                                                .grey.shade600,
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      const Icon(
                                                        CupertinoIcons
                                                            .star_circle,
                                                        size: 18,
                                                        color: Colors.yellow,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      AppText.labelMonts(
                                                        "${_data.rating!}",
                                                        12,
                                                        Colors.grey.shade600,
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
                                  }),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: AppText.labelMontsW500(
                          snapshot.error.toString(),
                          16,
                          Colors.grey,
                        ),
                      );
                    } else {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
