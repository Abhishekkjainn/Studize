import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:studize/screens/info/modelcontroller/ChapterView.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusServiceController.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SyllabusService controller = Get.find();
  TextEditingController chapterSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextField(
                onChanged: (value) {
                  controller.filteredSyllabus(value);
                },
                controller: chapterSearch,
                autocorrect: true,
                autofocus: true,
                cursorColor: Colors.blue,
                cursorRadius: Radius.circular(40),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.list_bullet_indent,
                      color: Colors.white,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.filteredSyllabus(chapterSearch.text);
                      },
                      child: Icon(
                        CupertinoIcons.search_circle_fill,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       controller.filteredSyllabus(chapterSearch.text);
                    //     },
                    //     icon: Icon(
                    //       CupertinoIcons.search_circle_fill,
                    //       size: 36,
                    //       color: Colors.white,
                    //     )),
                    enabled: true,
                    focusColor: Colors.white,
                    hintText: 'Integral Calculus',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
              ),
            ),
            GetBuilder<SyllabusService>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.SearchResult.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 36, 36, 36),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: IntrinsicHeight(
                                child: Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .SearchResult[index].ChapterName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        controller
                                            .SearchResult[index].SubjectTag,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                  onPressed: () {
                                    if (controller
                                            .SearchResult[index].SubjectTag ==
                                        'Mathematics') {
                                      Get.to(ChapterView(
                                          Subject: controller.Mathematics,
                                          SubjectName: 'Mathematics'));
                                    }
                                    if (controller
                                            .SearchResult[index].SubjectTag ==
                                        'Chemistry') {
                                      Get.to(ChapterView(
                                          Subject: controller.Chemistry,
                                          SubjectName: 'Chemistry'));
                                    }
                                    if (controller
                                            .SearchResult[index].SubjectTag ==
                                        'Physics') {
                                      Get.to(ChapterView(
                                          Subject: controller.Physics,
                                          SubjectName: 'Physics'));
                                    }
                                  },
                                  icon: Icon(
                                    CupertinoIcons.arrow_right_circle_fill,
                                    color: Colors.white,
                                    size: 32,
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
