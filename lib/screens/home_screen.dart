import 'dart:async';

import 'package:emergencyapp/screens/map/user_google_map.dart';
import 'package:emergencyapp/utils/colors.dart';
import 'package:emergencyapp/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';
import '../home_slider_widgets/slider_dots.dart';
import '../home_slider_widgets/slide_model.dart';
import '../home_slider_widgets/slider_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var policeButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.grey,
          backgroundColor: ColorsUnit.theamColor),
      onPressed: () {
        Navigator.pushNamed(context, '/policeRoot');
      },
      child: Row(
        children: const [
          Icon(
            HumanitarianIcons.police_station,
            size: 20.0,
          ),
          Text(
            " Need Police help?",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
    var ambulaceButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.grey,
          backgroundColor: ColorsUnit.theamColor),
      onPressed: () {
        Navigator.pushNamed(context, '/ambulnaceRoot');
      },
      child: Row(
        children: const [
          Icon(
            HumanitarianIcons.ambulance,
            size: 20.0,
          ),
          Text(
            " Need Ambulance?",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
    var fireBigadeButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.grey,
          backgroundColor: ColorsUnit.theamColor),
      onPressed: () {
        Navigator.pushNamed(context, '/firebigadeRoot');
      },
      child: Row(
        children: const [
          Icon(
            HumanitarianIcons.fire,
            size: 20.0,
          ),
          Text(
            " Need Fire Bigade?",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
    var width = MediaQuery.of(context).size.width / 7;
    return Material(
        child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: ColorsUnit.theamColor,
          backgroundColor: Colors.white,
          title: const Text(
            'Our Services',
            style: serviceheading,
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GoogleMapScreen(),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                    child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slideList.length,
                        itemBuilder: (context, i) => SliderItem(i),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          )
                        ],
                      ),
                    ])),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: width, top: width),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        policeButton,
                        ambulaceButton,
                        fireBigadeButton,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
