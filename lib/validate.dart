import 'package:calculator/request.dart';
import 'package:calculator/parse.dart';
import 'package:calculator/response.dart';


class Validate{

  Response method1(Request input) {
    RegExp regex1 =
      RegExp(r'^[0-9]+(\.[0-9]+)?([+\-*/]{1}[0-9]+(\.[0-9]+)?)+$');
    RegExp regex2 =
        RegExp(r'^[0-9]+(\.[0-9]+)?$');
    if(regex1.hasMatch(input.input)){
      return Parse.parseInput(input);
    }
    else{
      if(regex2.hasMatch(input.input)){
        return  Response(output: input.input);
      }
      return Response(output: 'Invalid Input');
    }
  }
}