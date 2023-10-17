import 'package:flutter/material.dart';
import 'package:your_type_mbti/util/app_color.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';

class AppResultDetail extends StatelessWidget {
  const AppResultDetail(
      {super.key,
      required this.characteristics,
      required this.description,
      required this.weaknesses});
  final String characteristics;
  final String description;
  final String weaknesses;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                // decoration: const BoxDecoration(
                //   color: Colors.white,
                //     borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(30),
                //   topRight: Radius.circular(30),
                // )),
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                description,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.pinkRed),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '특징',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(characteristics),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('약점',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(weaknesses),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('닫기'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColor.pinkRed,
        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Container(
        width: 180,
        height: 54,
        child: Center(
          child: Text(
            "자세히 보기",
            textAlign: TextAlign.center,
            style: AppTextstyle.koPtSemiBold20(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
