import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with TickerProviderStateMixin{
  late AnimationController animationController;

  late Animation<double> sizeAnimation;

  @override
  void initState() {
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 4),);

    sizeAnimation=Tween<double>(begin: 0,end: 1,).animate(animationController);

    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        centerTitle: true,
        title: Text(
          data['name'],
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              RotationTransition(
                turns: sizeAnimation,
                child: Hero(
                  tag: data['tag'],
                  child: Image.asset(data['iconImage'], height: 200, width: 200),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Mass : ${data['mass']}",
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Radius : ${data['radius']}",
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                "Temperature : ${data['temp']}",
                style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Description",
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "${data['description']}",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
