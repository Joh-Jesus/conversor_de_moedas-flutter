import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController? toText = TextEditingController();
  final TextEditingController? fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 300, right: 30, top: 100, bottom: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/moedas.jpg',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              controller: toText,
              itens: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
            ),
            SizedBox(height: 10),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              itens: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
            ),
            SizedBox(height: 50),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.amber,
              onPressed: () {
                homeController.convert();
              },
              child: Text('CONVERTER'),
            ),
          ],
        ),
      ),
    ));
  }
}





/*
DropdownButton(
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: Colors.amber,
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Real'),
                            ),
                            DropdownMenuItem(
                              child: Text('Dolar'),
                            ),
                          ],
                          onChanged: (value) {}),
 */