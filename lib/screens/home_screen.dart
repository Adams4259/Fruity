import 'package:flutter/material.dart';
import 'package:soko/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/data.dart';
import '../utils/utils.dart';
import '../widgets/product_widget.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top container
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Caspian Hacked",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  iconWidget(FontAwesomeIcons.bagShopping, true),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              //tagline
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Get your fresh items \n",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: "With",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: "Tamu Markets",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ))
              ])),
              const SizedBox(
                height: 30,
              ),

              //Search bar
              Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.70,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxShadow,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 25,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Search pinepple",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // category list
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index) {
                    //for internal padding of text
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          color: index == 0 ? kPrimaryColor : Colors.black45,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // product grid view
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: data[0].products!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: data[0].products![index],
                          ),
                        ),
                      ),
                      child: ProductWidget(
                        product: data[0].products![index],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
