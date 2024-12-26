import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../../theme/theme.dart';
import '../common_widgets/bottom_btn.dart';
import '../planet_details/planet_details.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  static const String routeName = '/explore';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: double.infinity,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MyTheme.blackClr, MyTheme.transparentClr],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/top_planet.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Explore',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 24, fontFamily: 'SpaceGrotesk'),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Which planet',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24, fontFamily: 'SpaceGrotesk'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'would you like to explore?',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24, fontFamily: 'SpaceGrotesk'),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    planets[index].image,
                    width: size.width * .8,
                    height: size.height * .4,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          index--;
                          if (index == -1) {
                            index = planets.length - 1;
                          }
                          setState(() {});
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xffEE403D),
                          child: Icon(Icons.arrow_back,
                              color: Colors.white, size: 22),
                        ),
                      ),
                      Text(
                        'Explore ${planets[index].name}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24),
                      ),
                      InkWell(
                        onTap: () {
                          index++;
                          if (index == planets.length) {
                            index = 0;
                          }
                          setState(() {});
                        },
                        child: const CircleAvatar(
                          backgroundColor: MyTheme.redClr,
                          child: Icon(Icons.arrow_forward_outlined,
                              color: Colors.white, size: 22),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  BottomBtn(
                      function: () {
                        Navigator.pushNamed(context, PlanetDetails.routeName,
                            arguments: planets[index]);
                      },
                      title: 'Explore ${planets[index].name}')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
