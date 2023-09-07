import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final wtContoller = TextEditingController();

  final htContoller = TextEditingController();

  double? bmi;

  Color? bmiColor;

  void _computeBMI() {
    if (wtContoller.text.isEmpty || htContoller.text.isEmpty) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final weight = double.tryParse(wtContoller.text);
    final height = double.tryParse(htContoller.text);

    if (weight == null || height == null) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final bmiValue = weight / ((height / 100) * (height / 100));
    setState(() {
      bmi = bmiValue;
      if (bmi! > 25) {
        bmiColor = Colors.red.shade800;
      } else if (bmi! < 17) {
        bmiColor = Colors.red.shade800;
      } else {
        bmiColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff89B0AE),
      appBar: AppBar(
        backgroundColor: const Color(0xff89B0AE),
        elevation: 0,
        title: Text(
          'BMI',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color(0xff333333),
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 225,
                width: 380,
                decoration: BoxDecoration(
                  color: const Color(0xffC4DCC1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight(in kg)',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: wtContoller,
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your weight',
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 97, 81, 81),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 225,
                width: 380,
                decoration: BoxDecoration(
                  color: const Color(0xffC4DCC1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height(in cm)',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: htContoller,
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your height',
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 97, 81, 81),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: _computeBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff358E8E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Compute',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff333333),
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            bmi != null
                ? Text(
                    'BMI: ${bmi!.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: bmiColor,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
