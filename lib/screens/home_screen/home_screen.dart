import 'package:flutter/material.dart';
import 'package:space_app/theme/theme.dart';

import '../common_widgets/bottom_btn.dart';
import '../explore_screen/explore_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: double.infinity,
            color: MyTheme.blackClr,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/earth.png'),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 258,
                      child: Text(
                        'Explore The Universe ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomBtn(
                        function: () {
                          Navigator.pushNamed(context, ExploreScreen.routeName);
                        },
                        title: 'Explore'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
