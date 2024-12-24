import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routers/routing.dart';
import 'widgets/custom_tab_bar.dart';

class MyTasksView extends StatelessWidget {
  const MyTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Logo",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/images/person_icon.svg')),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Color(0xff5F33E1),
                ))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                'My Tasks',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff7C7C80)),
              ),
            ),
            Expanded(child: CustomTabBar()),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {},
                icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffEBE5FF), shape: BoxShape.circle),
                    child: SvgPicture.asset('assets/images/qr_icon.svg'))),
            IconButton(
                onPressed: () {
                  
                },
                icon: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xff5F33E1), shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
