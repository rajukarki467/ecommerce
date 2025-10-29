import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/home/presentation/pages/profile/postpage.dart';
import 'package:frontend/feature/home/presentation/pages/profile/tagsscreens.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomImage(imgurl: "lock.png"),
              const SizedBox(width: 5),
              const Text(
                "Raju_k",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: UiHelper.CustomImage(imgurl: "Shape.png"),
            ),
          ],
        ),

        // ✅ FIX STARTS HERE
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          UiHelper.CustomImage(imgurl: "Oval.png"),
                          const SizedBox(width: 30),
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "54",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: const [
                                  Text(
                                    "665",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: const [
                                  Text(
                                    "800",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Raju Karki",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Digital goodies designer ....",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Everything is designs ",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 30,
                        width: 340,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // ✅ Highlights scroll
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.add, size: 40),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "New",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            for (var img in [
                              "Oval (1).png",
                              "Oval (2).png",
                              "Oval (3).png",
                            ])
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border: Border.all(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      child: UiHelper.CustomImage(imgurl: img),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Story",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              // ✅ Tab section outside scroll
              TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(icon: UiHelper.CustomImage(imgurl: "Grid Icon.png")),
                  Tab(icon: UiHelper.CustomImage(imgurl: "Tags Icon.png")),
                ],
              ),

              // ✅ Expanded only for TabBarView
              const Expanded(
                child: TabBarView(children: [Postpage(), Tagsscreens()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
