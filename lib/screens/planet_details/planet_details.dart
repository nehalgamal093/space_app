import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/models/planet.dart';
import 'package:space_app/screens/planet_details/widgets/text_details.dart';

import '../../theme/theme.dart';

class PlanetDetails extends StatelessWidget {
  static const String routeName = '/details';

  PlanetDetails({super.key});
  final Flutter3DController controller = Flutter3DController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Planet planet = ModalRoute.of(context)?.settings.arguments as Planet;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: double.infinity,
            height: size.height*.2,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff0E0E0E), Colors.transparent],
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
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: MyTheme.redClr,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: MyTheme.whiteClr,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              planet.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 24, fontFamily: 'SpaceGrotesk'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 39),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      planet.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24, fontFamily: 'SpaceGrotesk'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 343,
                            height: 343,
                            child: Flutter3DViewer(
                              activeGestureInterceptor: true,
                              enableTouch: true,
                              onProgress: (double progressValue) {
                                debugPrint(
                                    'model loading progress : $progressValue');
                              },
                              onLoad: (String modelAddress) {
                                debugPrint('model loaded : $modelAddress');
                              },
                              onError: (String error) {
                                debugPrint('model failed to load : $error');
                              },
                              controller: controller,
                              src: planet.model3d,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'About',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 24, fontFamily: 'SpaceGrotesk'),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                planet.about,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w300),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Distance from Sun (km) :',
                                details: planet.distanceFromSun),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Length of Day (hours) :',
                                details: planet.lengthOfDay),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Radius (km) :', details: planet.radius),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Mass (kg) :', details: planet.mass),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Gravity (m/s²) :',
                                details: planet.gravity),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextDetails(
                                label: 'Surface Area (km²) :',
                                details: planet.surfaceArea),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
