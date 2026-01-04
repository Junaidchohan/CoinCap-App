import 'package:coincap_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? deviceHeight, deviceWidth;
  HTTPService? http;

  @override
  void initState() {
    super.initState();
    http = GetIt.instance.get<HTTPService>();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [selectedCoinDropdown()],
        ),
      ),
    );
  }

  Widget selectedCoinDropdown() {
    List<String> coins = ["BTC", "ETH", "LTC", "XRP", "BCH"];
    List<DropdownMenuItem<String>> coinItems = coins.map((String coin) {
      return DropdownMenuItem<String>(
        value: coin,
        child: Text(
          coin,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }).toList();
    return DropdownButton(
      value: coins.first,
      items: coinItems,
      onChanged: (value) => {},
      dropdownColor: Color.fromRGBO(83, 88, 206, 1),
      iconSize: 30,
      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
      underline: Container(),
    );
  }
}
