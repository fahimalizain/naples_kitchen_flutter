import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/weather.dart';
import '../providers/button.dart';
import '../widgets/app_drawer.dart';
import '../screens/sales_screen.dart';
import '../screens/task_screen.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weatherscreen';
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<void> _save() async {
    await Provider.of<Weather>(context).getWeather();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _save();
  }

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<Weather>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.blue),
      ), // drawer: AppDrawer(),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Center(
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(
                  height: 60,
                ),
                Icon(
                  weather.getIconData(),
                  color: Colors.black,
                  size: 70,
                ),
                Text('${weather.temperature.round()}°',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 5,
                    )),
                Text(weather.description.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5,
                        fontSize: 15,
                        color: Colors.blueAccent)),
                SizedBox(
                  height: 30,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 24,
                  runSpacing: 24,
                  children: <Widget>[
                    MyWidget("sales", SalesScreen()),
                    MyWidget("task", TaskScreen()),
                    MyWidget("report", SalesScreen()),
                    MyWidget("others", SalesScreen()),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String providerName;
  Widget name;
  MyWidget(this.providerName, this.name);

  @override
  Widget build(BuildContext context) {
    ButtonProvider authProvider = ButtonProvider.getProvider(providerName);
    return Container(
      width: 100,
      height: 100,
      child: FlatButton(
        color: authProvider.getLoginButtonColor(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return name;
              },
            ),
          );
        },
        child: Text(
          authProvider.getLoginButtonText(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
