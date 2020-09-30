import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  ShimmerWidget({Key key}) : super(key: key);

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
            child: Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: Shimmer.fromColors(
          
          baseColor: Colors.grey,
          highlightColor: Colors.orange[100],
          child: Column(children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: height*0.02),
             Container(
              child: Row(children: <Widget>[
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                SizedBox(width: width * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.025,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Container(
                      height: height * 0.025,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ]),
        ),
      ),
    )));
  }
}
