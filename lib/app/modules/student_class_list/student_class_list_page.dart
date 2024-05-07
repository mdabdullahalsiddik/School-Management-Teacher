import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_management_teacher/app/routes/home_routes.dart';
import 'package:shimmer/shimmer.dart';

import 'student_class_list_controller.dart';

class StudentClassListPage extends GetView<StudentClassListController> {
  const StudentClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => Get.offAllNamed(
            HomeRoutes.home,
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Class List', style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("class").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: InkWell(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Gap(10);
                              },
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                  child: const ListTile(
                                    leading: Icon(
                                      Icons.people_alt_outlined,
                                    ),
                                    title: Text(""),
                                    subtitle: Text(""),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Gap(10);
                          },
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              child: ExpansionTile(
                                title: Text(
                                  snapshot.data!.docs[index].id.toUpperCase(),
                                ),
                                children: [
                                  ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Gap(3);
                                      },
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs[index]
                                          .data()['className']
                                          .length,
                                      itemBuilder: (context, index1) {
                                        return InkWell(
                                          onTap: () {
                                            print(
                                              snapshot
                                                  .data!.docs[index].reference
                                                  .collection(snapshot
                                                      .data!
                                                      .docs[index]["className"]
                                                          [index1]
                                                      .toString())
                                                  .doc("01")
                                                  .get()
                                                  .then((value) {
                                                print(value.data());
                                              }),
                                            );
                                          },
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.class_outlined,
                                            ),
                                            title: Text(snapshot
                                                .data!
                                                .docs[index]["className"]
                                                    [index1]
                                                .toString()),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            );
                          })),
                ),
              ],
            );
          }),
    );
  }
}
