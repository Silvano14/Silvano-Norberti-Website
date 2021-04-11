import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/header/header_view.dart';
import 'package:portfolio_flutter_web/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio_flutter_web/project/project_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silvano Norberti',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline2: GoogleFonts.vollkorn(
                color: Colors.white, backgroundColor: Colors.black),
            headline4: GoogleFonts.vollkorn(
                fontSize: 30,
                color: Colors.white,
                backgroundColor: Colors.black),
          )),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: DrawerView(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              NavigationBarView(),
              HeaderView(),
              ProjectView(),
              Container(height: height, width: width, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (!size.isMobile) return SizedBox();
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Silvano Norberti'),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue])),
              ),
              for (NavigationItem item in kNavigationItem)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
