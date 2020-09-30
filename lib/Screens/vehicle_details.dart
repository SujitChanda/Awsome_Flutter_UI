import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../app_theme.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

//const assetImage = AssetImage('assets/mypic.png');

class AddNewVehicle extends StatefulWidget {
  @override
  _AddNewVehicleState createState() => _AddNewVehicleState();
}

class _AddNewVehicleState extends State<AddNewVehicle> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final _ownerNameController = TextEditingController();
  final _classController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _chassisController = TextEditingController();
  final _regNoController = new MaskedTextController(mask: 'AA-00AA-0000');

  String ownerName;
  String vehicleClass;
  String registrationNumber;
  String vehicleBrand;
  String vehicleModel;
  String chassisNumber;

  double screenWidth, screenHeight;

  bool buttonValidation = false;

  _printLatestValue_ownerName() {
    print("ownerNameController: ${_ownerNameController.text}");
    setState(() {
      ownerName = _ownerNameController.text;
    });
  }

  _printLatestValue_registrationNumber() {
    print("regNoController: ${_regNoController.text}");

    setState(() {
      registrationNumber = _regNoController.text;
    });
  }

  _printLatestValue_vehicleBrand() {
    print("brandController: ${_brandController.text}");

    setState(() {
      vehicleBrand = _brandController.text;
    });
  }

  _printLatestValue_vehicleModel() {
    print("modelController: ${_modelController.text}");

    setState(() {
      vehicleModel = _modelController.text;
    });
  }

  _printLatestValue_chassisNumber() {
    print("chassisController: ${_chassisController.text}");

    setState(() {
      chassisNumber = _chassisController.text;
    });
  }

  _printLatestValue_vehicleClass() {
    print("classController: ${_classController.text}");
    setState(() {
      vehicleClass = _classController.text;
    });
  }

  @override
  void initState() {
    _ownerNameController.addListener(_printLatestValue_ownerName);
    _regNoController.addListener(_printLatestValue_registrationNumber);
    _modelController.addListener(_printLatestValue_vehicleModel);
    _brandController.addListener(_printLatestValue_vehicleBrand);
    _chassisController.addListener(_printLatestValue_chassisNumber);
    _classController.addListener(_printLatestValue_vehicleClass);

    super.initState();
  }

  @override
  void dispose() {
    _ownerNameController.dispose();
    _regNoController.dispose();
    _modelController.dispose();
    _brandController.dispose();
    _classController.dispose();
    _chassisController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryVariant,
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.5]),
      ),
      height: screenHeight,
      width: screenWidth,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          // resizeToAvoidBottomPadding: false,
          body: Container(
            child: Column(children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              header(context),
              SizedBox(height: screenHeight * 0.03),
              card(context),
              SizedBox(height: screenHeight * 0.02),
              Expanded(child: bottomBody(context)),
            ]),
          )),
    );
  }

  Widget header(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
          Text(
            "ADD VEHICLE DETAILS",
            style: TextStyle(
                fontFamily: 'MeriendaOne',
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
        ],
      ),
    );
  }

  Widget card(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
          decoration: BoxDecoration(boxShadow: customShadow),
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            controller: PageController(viewportFraction: 1),
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
            itemCount: 1,
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
                radius: 30,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 29,
                  backgroundImage: AssetImage('provider-logo.png'),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    registrationNumber == null || registrationNumber == ""
                        ? Text("XX-XXXX-XXXX",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))
                        : Text("$registrationNumber",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                    Container(
                      width: screenWidth * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          vehicleBrand == null || vehicleBrand == ""
                              ? Text(
                                  "Brand Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              : Text(
                                  "$vehicleBrand",
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
                          vehicleModel == null || vehicleModel == ""
                              ? Text("Model No",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300))
                              : Text(
                                  "$vehicleModel",
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
          ownerName == null || ownerName == ""
              ? Text("Owner : Owner's Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300))
              : Text("Owner : $ownerName",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
          vehicleClass == null || vehicleClass == ""
              ? Text("Class : Type of Vehicle",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300))
              : Text("Class : $vehicleClass",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
          chassisNumber == null || chassisNumber == ""
              ? Text("VIN No : MAXXXXXXXXXXXX123H",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300))
              : Container(
                  child: Text("VIN No : $chassisNumber",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300)),
                ),
        ],
      ),
    );
  }

  Widget vehicleForm(context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Form(
            key: _registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  child: TextFormField(
                    //inputFormatters: [new CardNumberInputFormatter()],
                    keyboardType: TextInputType.text,
                    controller: _regNoController,
                    textCapitalization: TextCapitalization.characters,
                    validator: validateMobile,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.car_rental,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Vehicle Registration Number.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Registration Number",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                Divider(
                  height: 8.0,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 4) {
                        return "Please Enter Full Name.";
                      }
                    },
                    textCapitalization: TextCapitalization.words,
                    controller: _ownerNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.perm_identity,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Owner's Name.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Owner's Name",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                Divider(height: 8.0),
                Container(
                  height: 50,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: _brandController,
                    validator: (value) {
                      if (value.length == 0) {
                        return "Please Enter Vehicle's Brand Name.";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(MdiIcons.tagOutline,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Vehicle's Brand Name.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Brand Name",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                Divider(height: 8.0),
                Container(
                  height: 50,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: _modelController,
                    validator: (value) {
                      if (value.length == 0) {
                        return "Please Enter Vehicle Model Name.";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(MdiIcons.tagTextOutline,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Vehicle's Model Name.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Model Name",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                Divider(height: 8.0),
                Container(
                  height: 50,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: _classController,
                    validator: (value) {
                      if (value.length == 0) {
                        return "Please Enter Vehicle Type.";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(MdiIcons.carConvertible,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Vehicle Type / Class. ",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Vehicle Type",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                Divider(height: 8.0),
                Container(
                  height: 50,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: _chassisController,
                    validator: (value) {
                      if (value.length == 0) {
                        return "Please Enter Vehicle Chassis Number.";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(77, 77, 77, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(MdiIcons.numeric,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                      hintText: "Vehicle Chassis Number.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "VIN Number",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        //   boxShadow: customShadow,
                        color: Colors.white,
                        shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        Center(
                            child: Container(
                          decoration: BoxDecoration(
                              // boxShadow: customShadow,
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
                              if (_registerFormKey.currentState.validate()) {
                                ownerName = _ownerNameController.text;
                                registrationNumber = _regNoController.text;
                                vehicleClass = _classController.text;

                                writeData();

                                Navigator.pop(context);

                                showToast("New Vehicle Added ", Colors.black);
                                setState(() {});
                              }
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  String validateMobile(String value) {
    String patttern =
        r"^[A-Z][A-Z][-][0-9][0-9][A-Z][A-Z][-][0-9][0-9][0-9][0-9]$";
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Registration Number is Required";
    } else if (value.length != 12) {
      return "Enter valid Number";
    } else if (!regExp.hasMatch(value)) {
      return "Enter valid Number";
    }

    return null;
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIos: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void writeData() {}

  Widget bottomBody(context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
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
        // decoration: BoxDecoration(boxShadow: customGreenShadow),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 20),
          child: vehicleForm(context),
        ));
  }
}
