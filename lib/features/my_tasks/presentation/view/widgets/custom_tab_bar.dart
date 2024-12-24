
import 'package:flutter/material.dart';

import 'all_task.dart';
import 'finished_task.dart';
import 'in_progress.dart';
import 'waiting_task.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<String> items = [
    "All",
    "InProgress",
    "Waiting",
    "Finished",
  ];
  List<Widget> pages = [
    AllTask(),
    InProgressTask(),
    WaitingTask(),
    FinishedTask()
  ];
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                          pageController.animateToPage(
                            current,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: current == index
                                ? const Color(0xff5F33E1)
                                : const Color(0xffF0ECFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: current == index
                                      ? Colors.white
                                      : Color(0xff7C7C80)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/1.334,
            // color: Colors.amber,
            child: PageView.builder(
              itemCount: pages.length,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}



