import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_flutter_app/common_widgets/ui_elements.dart';
import 'package:hello_flutter_app/views/assets.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class MyLayout1 extends StatelessWidget {
  const MyLayout1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Layout 1',
      home: Material(
          // using Material is esential to remove double yellow underline
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              Image.network(
                  'https://cdn.pixabay.com/photo/2016/06/20/23/50/mixed-berries-1470228_1280.jpg'),
              myRow1(),
              buildDishProperties(
                  prepTime: '25 min',
                  cookTime: '1 hr',
                  serveNumberOfPeople: '4-6 People'),
              Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 134, 134)),
                  child: starRatig()),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 134, 134)),
                height: 800,
              ),
              myRow2(),
            ],
          )),
    );
  }
}

Widget myRow1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // SvgAssets['recipt_44'],
      // SvgAssets['warehouse_44'],
      svgButton(
        labelSize: 12,
        svgName: 'recipt',
        labelText: 'Reciepts',
        svgSize: 42,
      ),
      svgButton(
        labelSize: 12,
        svgName: 'warehouse',
        labelText: 'Add to Warehouse',
        svgSize: 42,
      ),
    ],
  );
}

Widget myRow2() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        'assets/svg/receipt_long.svg',
        width: 82,
        height: 82,
      ),
      SvgPicture.asset(
        'assets/svg/warehouse.svg',
        width: 82,
        height: 82,
      ),
      SvgPicture.asset(
        'assets/svg/receipt_long.svg',
        width: 82,
        height: 82,
      ),
    ],
  );
}

Widget starRatig() {
  var starts = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Color.fromARGB(255, 43, 141, 227)),
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );

  var text = const Text(
    '170 Reviews',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 20,
    ),
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // Horizontal center alignment
    children: [starts, text],
  );
}

const descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 1.2,
);

Widget buildDishProperties({
  required String prepTime,
  required String cookTime,
  required String serveNumberOfPeople,
}) {
  return DefaultTextStyle.merge(
    style: descTextStyle, // You should define descTextStyle somewhere
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          infoPrepTime(time: prepTime),
          infoCookTime(time: cookTime),
          infoFeed(numberOfPeople: serveNumberOfPeople)
        ],
      ),
    ),
  );
}

Widget infoPrepTime({required String time}) {
  return Column(
    children: [
      Icon(Icons.kitchen, color: Colors.green[500]),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            const Text('PREP:'),
            Text(time),
          ],
        ),
      ),
    ],
  );
}

Widget infoCookTime({required String time}) {
  return Column(
    children: [
      Icon(Icons.timer, color: Colors.green[500]),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            const Text('COOK:'),
            Text(time),
          ],
        ),
      ),
    ],
  );
}

Widget infoFeed({required String numberOfPeople}) {
  return Column(
    children: [
      Icon(Icons.restaurant, color: Colors.green[500]),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            const Text('FEEDS:'),
            Text(numberOfPeople),
          ],
        ),
      ),
    ],
  );
}
