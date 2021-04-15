import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:get_version/get_version.dart';
import 'package:bettingtips/utils/constants.dart';
import 'package:bettingtips/utils/styles.dart';
import 'package:bettingtips/views/partials/common_appbar_actions.dart';
import 'package:bettingtips/views/partials/fake_bottom_buttons.dart';

import 'package:bettingtips/blocs/tips_bloc.dart';
import 'package:bettingtips/views/partials/Concept1Drawer/Concept1Drawer.dart';

import 'package:provider/provider.dart';

import 'package:bettingtips/views/partials/Concept1Drawer/DrawerScreen.dart';

// class AboutPage extends StatefulWidget {
//   @override
//   _AboutPageState createState() => _AboutPageState();
// }

// class _AboutPageState extends State<AboutPage> {
//   String _platformVersion = 'Unknown';
//   String _projectVersion = '';
//   String _projectCode = '';
//   String _projectAppID = '';
//   String _projectName = '';

//   Color iconColor = Colors.grey[500];
//   TextStyle titleStyle = TextStyle(color: Colors.grey[700]);
//   TextStyle subtitleStyle = TextStyle(color: Colors.grey[500]);

//   _setPackageInfo() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await GetVersion.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     String projectVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       projectVersion = await GetVersion.projectVersion;
//     } on PlatformException {
//       projectVersion = 'Failed to get project version.';
//     }

//     String projectCode;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       projectCode = await GetVersion.projectCode;
//     } on PlatformException {
//       projectCode = 'Failed to get build number.';
//     }

//     String projectAppID;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       projectAppID = await GetVersion.appID;
//     } on PlatformException {
//       projectAppID = 'Failed to get app ID.';
//     }

//     String projectName;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       projectName = await GetVersion.appName;
//     } on PlatformException {
//       projectName = 'Failed to get app name.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = platformVersion;
//       _projectVersion = projectVersion;
//       _projectCode = projectCode;
//       _projectAppID = projectAppID;
//       _projectName = projectName;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     _setPackageInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("About App"),
//         actions: CommonAppBarActions(),
//       ),
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             SizedBox(
//               height: 10.0,
//             ),
//             Card(
//               color: Styles.commonDarkCardBackground,
//               margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: <Widget>[
//                     Text("About Us",
//                         style: Styles.title.copyWith(
//                           height: 1,
//                           fontSize: 22,
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(70.0, 10, 70.0, 10.0),
//                       child: Divider(
//                         color: Colors.grey[500],
//                         height: 4,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         Constants.appAbout,
//                         style: Styles.p,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: iconColor,
//               ),
//               title: Text('Name', style: titleStyle),
//               subtitle: Text(_projectName, style: subtitleStyle),
//             ),
//             Container(
//               height: 10.0,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: iconColor,
//               ),
//               title: Text('Running on', style: titleStyle),
//               subtitle: Text(_platformVersion, style: subtitleStyle),
//             ),
//             Divider(
//               height: 20.0,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: iconColor,
//               ),
//               title: Text('Version Name', style: titleStyle),
//               subtitle: Text(_projectVersion, style: subtitleStyle),
//             ),
//             Divider(
//               height: 20.0,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: iconColor,
//               ),
//               title: Text('Version Code', style: titleStyle),
//               subtitle: Text(_projectCode, style: subtitleStyle),
//             ),
//             Divider(
//               height: 20.0,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: iconColor,
//               ),
//               title: Text('App ID', style: titleStyle),
//               subtitle: Text(_projectAppID, style: subtitleStyle),
//             ),
//             Container(
//               height: 120,
//               padding: EdgeInsets.all(15),
//               child: Image.asset('assets/images/logo.png'),
//             ),
//             FakeBottom(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AboutPage extends StatefulWidget {
  AboutPage({
    Key key,
  }) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    //menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => menuController,
      child: ScreenHomePage(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  color: Colors.grey[200],
                  child: Container(
                    color: Colors.grey[200],
                  ),
                )),
      ),
    );
  }
}

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class ScreenHomePage extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;
  final String tag;
  final String title;

  ScreenHomePage({
    this.menuScreen,
    this.contentScreen,
    this.tag,
    this.title,
  });

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  TipsBloc _tipsBloc;
  String mytag;
  String mytitle;

  @override
  void initState() {
    _tipsBloc = new TipsBloc();
    mytag = widget.tag;
    mytitle = widget.title;
    super.initState();
  }

  void dispose() {
    _tipsBloc.dispose();
    super.dispose();
  }

  createContentDisplay() {
    String _platformVersion = 'Unknown';
    String _projectVersion = '';
    String _projectCode = '';
    String _projectAppID = '';
    String _projectName = '';

    Color iconColor = Colors.grey[500];
    TextStyle titleStyle = TextStyle(color: Colors.grey[700]);
    TextStyle subtitleStyle = TextStyle(color: Colors.grey[500]);

    _setPackageInfo() async {
      String platformVersion;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        platformVersion = await GetVersion.platformVersion;
      } on PlatformException {
        platformVersion = 'Failed to get platform version.';
      }

      String projectVersion;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        projectVersion = await GetVersion.projectVersion;
      } on PlatformException {
        projectVersion = 'Failed to get project version.';
      }

      String projectCode;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        projectCode = await GetVersion.projectCode;
      } on PlatformException {
        projectCode = 'Failed to get build number.';
      }

      String projectAppID;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        projectAppID = await GetVersion.appID;
      } on PlatformException {
        projectAppID = 'Failed to get app ID.';
      }

      String projectName;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        projectName = await GetVersion.appName;
      } on PlatformException {
        projectName = 'Failed to get app name.';
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;
      _setPackageInfo();
      setState(() {
        _platformVersion = platformVersion;
        _projectVersion = projectVersion;
        _projectCode = projectCode;
        _projectAppID = projectAppID;
        _projectName = projectName;
      });
    }

    return zoomAndSlideContent(new Container(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              mytitle,
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontSize: 23.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: new IconButton(
              icon: Icon(
                EvaIcons.menu2Outline,
                color: Colors.black,
              ),
              onPressed: () {
                Provider.of<MenuController>(context, listen: false).toggle();
              }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(onTap: () {}, child: Icon(EvaIcons.personOutline)),
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Card(
                color: Styles.commonDarkCardBackground,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text("About Us",
                          style: Styles.title.copyWith(
                            height: 1,
                            fontSize: 22,
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(70.0, 10, 70.0, 10.0),
                        child: Divider(
                          color: Colors.grey[500],
                          height: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Constants.appAbout,
                          style: Styles.p,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: iconColor,
                ),
                title: Text('Name', style: titleStyle),
                subtitle: Text(_projectName, style: subtitleStyle),
              ),
              Container(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: iconColor,
                ),
                title: Text('Running on', style: titleStyle),
                subtitle: Text(_platformVersion, style: subtitleStyle),
              ),
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: iconColor,
                ),
                title: Text('Version Name', style: titleStyle),
                subtitle: Text(_projectVersion, style: subtitleStyle),
              ),
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: iconColor,
                ),
                title: Text('Version Code', style: titleStyle),
                subtitle: Text(_projectCode, style: subtitleStyle),
              ),
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: iconColor,
                ),
                title: Text('App ID', style: titleStyle),
                subtitle: Text(_projectAppID, style: subtitleStyle),
              ),
              Container(
                height: 120,
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/images/logo.png'),
              ),
              FakeBottom(),
            ],
          ),
        ),
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: false).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: false).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }
}

//
// Create item card
//
