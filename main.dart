import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaleValue = 1.0;
  var _rotValeu = 3.14;
  var _transX = 0.0;
  var _transY = 0.0;

  var _rotationZ = 0.0;
  var _rotationX = 0.0;
  var _rotationY = 0.0;
  var _mScale = 1.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Transform')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: PageView(
          children: <Widget>[
            // scale
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Scale'),
                  SizedBox(
                    height: 50,
                  ),
                  Transform.scale(
                    scale: _scaleValue,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'x$_scaleValue',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Slider(
                    value: _scaleValue,
                    max: 3,
                    min: 0,
                    onChanged: (value) {
                      setState(() {
                        _scaleValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            // translate
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Translate'),
                  Transform.translate(
                    offset: Offset(_transX, _transY),
                    child: Container(
                      height: 150,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text("$_rotValeu"),
                  Column(
                    children: <Widget>[
                      Text('Translate Value X : $_transX'),
                      Slider(
                        min: -500,
                        max: 500,
                        value: _transX,
                        onChanged: (value) {
                          setState(() {
                            _transX = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Translate Value X : $_transY'),
                      Slider(
                        min: -500,
                        max: 500,
                        value: _transY,
                        onChanged: (value) {
                          setState(() {
                            _transY = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            // rotation
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Rotation'),
                  Transform.rotate(
                    angle: _rotValeu,
                    child: Container(
                      height: 150,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text("$_rotValeu"),
                  Slider(
                    min: 0,
                    max: 2 * 3.14,
                    value: _rotValeu,
                    onChanged: (value) {
                      setState(() {
                        _rotValeu = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Matrixe4'),
                  Transform(
                    origin: Offset(0.0, 0.0),
                    transform: Matrix4.rotationZ(_rotationZ)
                      ..rotateX(_rotationX)
                      ..rotateY(_rotationY)
                      ..scale(_mScale),
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: size.width / 3.5,
                            child: Column(
                              children: <Widget>[
                                Text('Rotation Z value'),
                                Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  value: _rotationZ,
                                  onChanged: (value) {
                                    setState(() {
                                      _rotationZ = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3.5,
                            child: Column(
                              children: <Widget>[
                                Text('Rotation X value'),
                                Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  value: _rotationX,
                                  onChanged: (value) {
                                    setState(() {
                                      _rotationX = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3.5,
                            child: Column(
                              children: <Widget>[
                                Text('Rotation Y value'),
                                Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  value: _rotationY,
                                  onChanged: (value) {
                                    setState(() {
                                      _rotationY = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('Matrix4 Scale Value'),
                            Slider(
                              min: 0.0,
                              max: 10.0,
                              value: _mScale,
                              onChanged: (value) {
                                setState(() {
                                  _mScale = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
