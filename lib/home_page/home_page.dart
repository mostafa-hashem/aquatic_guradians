import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import '../show_all/show_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.06, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 22),
            child: Text(
              "Hi, Abdo",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
          ),
          Flexible(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: provider.seas.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                  crossAxisCount: 2, mainAxisSpacing: 35, crossAxisSpacing: 30),
              itemBuilder: (context, index) => Card(
                elevation: 20,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowAll(
                              title: provider.seas[index].bodyModel.name,
                              image: provider.seas[index].bodyModel.image,
                              description:
                                  provider.seas[index].bodyModel.description,
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.15
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.asset(
                                  provider.seas[index].bodyModel.image,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                        ),
                        Text(
                          provider.seas[index].bodyModel.name,
                          style: GoogleFonts.novaSquare(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
