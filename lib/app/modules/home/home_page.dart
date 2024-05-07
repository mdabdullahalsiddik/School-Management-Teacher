import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_management_teacher/app/routes/student_class_list_routes.dart';
import 'package:shimmer/shimmer.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Row(
          children: [
            Icon(
              Icons.school_outlined,
            ),
            Gap(10),
            Text('School Management', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      drawer: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("teacher")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Drawer(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      currentAccountPicture: const CircleAvatar(),
                      accountName: const Text(""),
                      accountEmail: const Text(""),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.person,
                      ),
                      title: Text("Profile"),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: Text("logout"),
                    ),
                  ],
                ),
              );
            }
            return Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data!.data()!["image"].toString(),
                      ),
                    ),
                    accountName:
                        Text(snapshot.data!.data()!["name"].toString()),
                    accountEmail: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(
                        Icons.person,
                      ),
                      title: Text("Profile"),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.singOut(),
                    child: const ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: Text("logout"),
                    ),
                  ),
                ],
              ),
            );
          }),
      body: Center(
        child: Column(
          children: [
            const Gap(10),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("banner")
                      .snapshots(),
                  builder: (context, snapshot) {
                    List bannerItem = snapshot.data?.docs ?? [];
                    return CarouselSlider.builder(
                      itemCount: bannerItem.length,
                      itemBuilder: (context, index, realIndex) {
                        if (bannerItem.isEmpty) {
                          return SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[300]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                bannerItem[index]["image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: true,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(StudentClassListRoutes.studentClassList),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  child: ListTile(
                    leading: Icon(
                      Icons.people_alt_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: const Text("Students List"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
