import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modals/planet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late AnimationController animationController;
  late AnimationController scaleanimationController;

  late Animation<double> sizeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 4),);
    scaleanimationController=AnimationController(vsync: this,duration: const Duration(seconds: 3),);

    sizeAnimation=Tween<double>(begin: 0,end: 1,).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    scaleAnimation=Tween<double>(begin: 0,end: 1,).animate(CurvedAnimation(parent: scaleanimationController, curve: Curves.easeInOut));

    animationController.repeat();
    scaleanimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Planets App",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      body: Stack(
        children: [
          ScaleTransition(scale: scaleAnimation,child: const Image(image: AssetImage("assets/images/galaxy.jpg"),)),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: planets.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'details_page',arguments: planets[i]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        RotationTransition(
                          turns: sizeAnimation,
                          child: Hero(
                            tag: planets[i]['tag'],
                            child: Image.asset(
                              planets[i]['iconImage'],
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              planets[i]['name'],
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mass : ",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${planets[i]['mass']}",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Radius : ",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${planets[i]['radius']}",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
