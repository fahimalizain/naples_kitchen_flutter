import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ButtonProvider {
  String getLoginButtonText();
  Color getLoginButtonColor();

  static ButtonProvider getProvider(String providerName) {
    switch (providerName.toLowerCase()) {
      case "sales":
        return Sales();
      case "task":
        return Task();
      case "report":
        return Report();
      case "others":
        return Others();
      default:
        throw ('$providerName not supported');
    }
  }
}

class Sales extends ButtonProvider {
  @override
  String getLoginButtonText() {
    return "Sales\n&\nExpense";
  }

  @override
  Color getLoginButtonColor() => Colors.blue[700];
}

class Task extends ButtonProvider {
  @override
  String getLoginButtonText() {
    return "Task";
  }

  @override
  Color getLoginButtonColor() => Colors.yellow[800];
}

class Report extends ButtonProvider {
  @override
  String getLoginButtonText() {
    return "Report";
  }

  @override
  Color getLoginButtonColor() => Colors.red[700];
}

class Others extends ButtonProvider {
  @override
  String getLoginButtonText() {
    return "Others";
  }

  @override
  Color getLoginButtonColor() => Colors.green[700];
}
