import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:responsive_view/latihan/controller.dart';

class CounterPage extends View {
  CounterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends ResponsiveViewState<CounterPage, CounterController> {
  CounterState() : super(CounterController());

  @override
  Widget get desktopView {
    return ControlledWidgetBuilder<CounterController>(
      builder: (context, controller) => Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<CounterController>(
      builder: (context, controller) => controller.isSmartTv
          ? desktopView
          : Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                )
              ],
            ),
    );
  }

  @override
  Widget get tabletView => ControlledWidgetBuilder<CounterController>(
        builder: (context, controller) => controller.isSmartTv
            ? desktopView
            : Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  )
                ],
              ),
      );

  @override
  Widget get watchView => mobileView;
}
