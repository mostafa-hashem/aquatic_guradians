import 'package:ag/provider.dart';
import 'package:ag/show_all/show_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    var provider = Provider.of<MyAppProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.02,
          right: MediaQuery.sizeOf(context).width * 0.02,
          top: MediaQuery.sizeOf(context).height * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: textEditingController,
            onChanged: (value) {},
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.lightBlue,
                    width: 2.0,
                  ),
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.lightBlue),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: const Icon(Icons.close)),
          ),
          const SizedBox(
            height: 24,
          ),
          Flexible(
            flex: 1,
            child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowAll(
                                title: provider.seas[index].bodyModel.name,
                                image: provider.seas[index].bodyModel.image,
                                description: provider.seas[index].bodyModel.description,
                              ),
                            ));
                      },
                      child: Card(
                        elevation: 2,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child:
                                      Image.asset(provider.seas[index].bodyModel.image)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              provider.seas[index].bodyModel.name,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
                itemCount: provider.seas.length),
          ),
          Flexible(
            flex: 3,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: provider.body.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowAll(
                              title: provider.body[index].name,
                              image: provider.body[index].image,
                              description: provider.body[index].description,
                            ),
                          ));
                    },
                    child: Card(
                      elevation: 20,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              provider.body[index].image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.body[index].name,
                                  style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width * 2),
                                  child: Text(
                                    maxLines: 3,
                                    provider.body[index].description,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
