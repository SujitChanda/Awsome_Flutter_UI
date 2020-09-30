import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/Screens/vehicle_details.dart';
import 'package:provider/animation/bouncy_page_route.dart';
import 'package:provider/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDashboardPage extends StatefulWidget {
  const MenuDashboardPage({Key key}) : super(key: key);

  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with TickerProviderStateMixin {
  double left = 0;
  double right = 0;
  bool isCollapsed = true;
  bool isCollapsedSetting = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<double> _settingScaleAnimation;
  Animation<Offset> _menuSlideAnimation;
  Animation<Offset> _settingSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);

    _scaleAnimation = Tween<double>(begin: 1, end: 0.85).animate(_controller);
    
    _menuScaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(_controller);
    _menuSlideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);

    _settingScaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(_controller);
    _settingSlideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    

    return Scaffold(
     
        //resizeToAvoidBottomInset: false,
        body: Stack(
            children: <Widget>[
              setting(context),
              menu(context),
              dashboard(context),
            ],
          ));
  }

  Widget menu(context) {
    return SlideTransition(
      position: _menuSlideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Container(
          width: screenWidth * 0.495,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 40, bottom: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 59,
                              backgroundImage: AssetImage('mypic2.jpeg'),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: screenWidth * 0.5,
                            child: Text(
                              "Sujit Chanda",
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: screenWidth * 0.5,
                            child: Text(
                              "S.chanda@outlook.com",
                              style: Theme.of(context).textTheme.body2,
                            ),
                          )
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                              shadowColor: Colors.green,
                              color: Theme.of(context).colorScheme.primary,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: InkWell(
                                highlightColor: Colors.green.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                child: ListTile(
                                    leading: Icon(
                                      MdiIcons.carInfo,
                                      color: Theme.of(context).iconTheme.color,
                                      size: Theme.of(context).iconTheme.size,
                                    ),
                                    title: Text(
                                      "Add Vehicle",
                                      style: Theme.of(context).textTheme.body2,
                                    )),
                                onTap: () {
                                  Navigator.push(context,
                                      BouncyPageRoute(widget: AddNewVehicle()));
                                },
                              )),
                          SizedBox(height: 10.0),
                          Card(
                              shadowColor: Colors.green,
                              color: Theme.of(context).colorScheme.primary,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: InkWell(
                                highlightColor: Colors.green.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                child: ListTile(
                                    leading: Icon(
                                      MdiIcons.steering,
                                      color: Theme.of(context).iconTheme.color,
                                      size: Theme.of(context).iconTheme.size,
                                    ),
                                    title: Text(
                                      "Add Driver",
                                      style: Theme.of(context).textTheme.body2,
                                    )),
                                onTap: () {},
                              )),
                          SizedBox(height: 10.0),
                          Card(
                              shadowColor: Colors.green,
                              color: Theme.of(context).colorScheme.primary,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: InkWell(
                                highlightColor: Colors.green.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                child: ListTile(
                                    leading: Icon(
                                      MdiIcons.trendingUp,
                                      color: Theme.of(context).iconTheme.color,
                                      size: Theme.of(context).iconTheme.size,
                                    ),
                                    title: Text(
                                      "Trip Details",
                                      style: Theme.of(context).textTheme.body2,
                                    )),
                                onTap: () {},
                              )),
                          SizedBox(height: 10.0),
                          Card(
                              shadowColor: Colors.green,
                              color: Theme.of(context).colorScheme.primary,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: InkWell(
                                highlightColor: Colors.green.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.payment,
                                      color: Theme.of(context).iconTheme.color,
                                      size: Theme.of(context).iconTheme.size,
                                    ),
                                    title: Text(
                                      "Payments",
                                      style: Theme.of(context).textTheme.body2,
                                    )),
                                onTap: () {},
                              )),
                          SizedBox(height: 10.0),
                        ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget setting(context) {
    return SlideTransition(
      position: _settingSlideAnimation,
      child: ScaleTransition(
        scale: _settingScaleAnimation,
        child: Container(

           
            child: Row(children: <Widget>[
          Container(
            width: screenWidth * 0.505,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 40, bottom: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('provider-logo.png'),
                              ),
                            ),
                            Text(
                              "",
                              style: Theme.of(context).textTheme.body1,
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              " ",
                              style: Theme.of(context).textTheme.body2,
                            )
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                                shadowColor: Colors.green,
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: InkWell(
                                  highlightColor: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  child: ListTile(
                                      trailing: Icon(
                                        MdiIcons.cardAccountDetailsOutline,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        size: Theme.of(context).iconTheme.size,
                                      ),
                                      title: Text(
                                        "My Account",
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      )),
                                  onTap: () {},
                                )),
                            SizedBox(height: 10.0),
                            Card(
                                shadowColor: Colors.green,
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: InkWell(
                                  highlightColor: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  child: ListTile(
                                      trailing: Icon(
                                        MdiIcons.fileDocumentMultipleOutline,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        size: Theme.of(context).iconTheme.size,
                                      ),
                                      title: Text(
                                        "Documents",
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      )),
                                  onTap: () {},
                                )),
                            SizedBox(height: 10.0),
                            Card(
                                shadowColor: Colors.green,
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: InkWell(
                                  highlightColor: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  child: ListTile(
                                      trailing: Icon(
                                        MdiIcons.officeBuildingMarkerOutline,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        size: Theme.of(context).iconTheme.size,
                                      ),
                                      title: Text(
                                        "About",
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      )),
                                  onTap: () {},
                                )),
                            SizedBox(height: 10.0),
                            Card(
                                shadowColor: Colors.green,
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: InkWell(
                                  highlightColor: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  child: ListTile(
                                      trailing: Icon(
                                        MdiIcons.power,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        size: Theme.of(context).iconTheme.size,
                                      ),
                                      title: Text(
                                        "Logout",
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      )),
                                  onTap: () {},
                                )),
                            SizedBox(height: 10.0),
                          ]),
                    ]),
              ),
            ),
          )
        ])),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: left,
      right: right,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
            elevation: 20,

            // color: Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryVariant,
                      Colors.white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.4, 0.5]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              height: screenHeight,
              width: screenWidth,
              child: Column(children: <Widget>[
                appBar(context),
                cards(context),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: tripListContainer(context),
                ),
              ]),
            )),
      ),
    );
  }

  Widget appBar(context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFF23b574),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10.0, top: 30, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            InkWell(
              highlightColor: Colors.green,
              child: Container(
                height: 50,
                width: 50,
                child: isCollapsed
                    ? Icon(Icons.menu,
                        size: 28,
                        color: Theme.of(context).appBarTheme.iconTheme.color)
                    : Icon(Icons.menu_open,
                        size: 35,
                        color: Theme.of(context).appBarTheme.iconTheme.color),
              ),
              onTap: () {
                setState(() {
                  if (isCollapsed) {
                    left = 0.40 * screenWidth;
                    right = -0.60 * screenWidth;
                    _controller.forward();
                   
                   
                  } else {
                     left = 0;
                    right = 0;
                    _controller.reverse();
                   
                  }
                  isCollapsed = !isCollapsed;
                });

                print("Left : ${left.toString()}");
                print("Right: ${right.toString()}");
                print("Menu Button : ${isCollapsed.toString()}");
                print("Setting Button : ${isCollapsedSetting.toString()}");
              },
            ),
           new Expanded(
            child: new Container(
              margin: EdgeInsets.only(left:10, right: 10),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
            Text(
              "HOME",
              style: TextStyle(
                  fontFamily: 'MeriendaOne',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
           new Expanded(
            child: new Container(
              margin: EdgeInsets.only(left:10, right: 10),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
          
            InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  child: isCollapsedSetting
                      ? Icon(Icons.settings,
                          size: 28,
                          color: Theme.of(context).appBarTheme.iconTheme.color)
                      : Icon(MdiIcons.cogOutline,
                          size: 35,
                          color: Theme.of(context).appBarTheme.iconTheme.color),
                ),
                onTap: () {
                  setState(() {
                    if (!isCollapsedSetting) {
                      left = 0;
                      right = 0;
                      _controller.reverse();
                    } else {
                      left = -0.60 * screenWidth;
                      right = 0.40 * screenWidth;
                      _controller.forward();
                    }
                    isCollapsedSetting = !isCollapsedSetting;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget cards(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
          decoration: BoxDecoration(boxShadow: customShadow),
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.95),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          left: 100,
                          top: 135,
                          bottom: -100,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: customShadow,
                                shape: BoxShape.circle,
                                color: Colors.white60),
                          )),
                      Positioned.fill(
                          left: -5,
                          top: -100,
                          bottom: -100,
                          right: 80,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: customShadow,
                                shape: BoxShape.circle,
                                color: Colors.white60),
                          )),
                      cardDetails(context),
                    ],
                  ));
            },
            itemCount: 3,
          )),
    );
  }

  Widget cardDetails(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 24,
                  backgroundImage: AssetImage('provider-logo.png'),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("WB-25AG-3428",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    Container(
                      width: screenWidth * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Hyundai",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(' | ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                          Text(
                            "Grand i10",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text("Owner : Sujit Chanda",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300)),
          Text("Class : L.M.V",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300)),
          Text("VIN No : MALA265CLFM987546H",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  Widget bodyText(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Today's Trip", style: Theme.of(context).textTheme.headline),
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  // boxShadow: customShadow,
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: Stack(
                children: [
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        //   boxShadow: customShadow,
                        color: Colors.black,
                        shape: BoxShape.circle),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  )),
                  Center(
                    child: InkResponse(
                      highlightColor: Colors.green,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onTap: () {
                       
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget tripListContainer(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        //  boxShadow: customShadow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              bodyText(context),
              // SizedBox(height: screenHeight * 0.01),
              Expanded(child: tripList(context)),
            ],
          )),
    );
  }

  Widget tripList(context) {
    return Container(
      // decoration: BoxDecoration(boxShadow: customGreenShadow),
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: tile(context)
              //  Card(
              //     color: Theme.of(context).colorScheme.primary,
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5)),
              //     margin:
              //         const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
              //     child:tile(context)),
            );
          },
          itemCount: 6),
    );
  }

  Widget tile(context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right:10),
          child: Theme(data: theme, 
                      child: ExpansionTile(
              
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage('hyundai-logo.png'),
                ),
              ),
              title: Text(
                "WB-38AG-3428",
                style: Theme.of(context).textTheme.body1,
              ),
              subtitle:
                  Text("Trip : Durgapur", style: Theme.of(context).textTheme.body2),
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left:77,),
                            child: Text("Driver : Tanmoy Bhattacharya",
                                style: Theme.of(context).textTheme.body2),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 80, right: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonTheme(
                                height: 40,
                                minWidth: 50,
                                child: OutlineButton(
                                  splashColor: Color(0XFF23b574),
                                  highlightColor: Color(0XFF23b574),
                                  highlightedBorderColor: Colors.black,
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  onPressed: () {
                                    print("Calling 8906639167");
                                  },
                                  child: Text("Details",
                                      style: Theme.of(context).textTheme.body2),
                                ),
                              ),
                              ButtonTheme(
                                height: 40,
                                minWidth: 50,
                                child: OutlineButton(
                                  splashColor: Color(0XFF23b574),
                                  highlightColor: Color(0XFF23b574),
                                  highlightedBorderColor: Colors.black,
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  onPressed: () {
                                    print("Calling 8906639167");
                                  },
                                  child: Text("Payment",
                                      style: Theme.of(context).textTheme.body2),
                                ),
                              ),
                              ButtonTheme(
                                height: 40,
                                minWidth: 50,
                                child: OutlineButton(
                                  splashColor: Color(0XFF23b574),
                                  highlightColor: Color(0XFF23b574),
                                  highlightedBorderColor: Colors.black,
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  onPressed: () {
                                    launch("tel://+918906639167");
                                    print("Calling 8906639167");
                                  },
                                  child: Text("Call",
                                      style: Theme.of(context).textTheme.body2),
                                ),
                              ),
                            ]),
                      ),
                      
                    ]),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90, right: 20),
          child: Divider(height:5,thickness: 0.5, color: Colors.black.withOpacity(0.3)),
        ),
      ],
    );
  }

}
