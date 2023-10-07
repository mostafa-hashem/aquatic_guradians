import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowAll extends StatelessWidget {
  static const String routName = "ShowAll";
  final String? title;
  final String? image;
  final String? description;

  const ShowAll({super.key, this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        elevation: 20,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 0.03.sh,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22)),
                child: Image.asset(image!),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: GoogleFonts.novaSquare(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ],
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Text(
                description!,
                style: GoogleFonts.novaSquare(fontSize: 15,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
