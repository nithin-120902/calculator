//import 'dart:collection';

import 'package:calculator/evaluation.dart';
import 'package:calculator/request.dart';
import 'package:calculator/elements.dart';
import 'package:calculator/response.dart';

class Parse{

  static Response parseInput(Request req){
    Elements s = Elements();
    int j=0;
    for(int i=0;i<req.input.length;i++){
      if(req.input[i]=='+' || req.input[i]=='-' || req.input[i]=='*' || req.input[i]=='/'){
        s.push(req.input.substring(j,i));
        s.push(req.input[i]);
        j=i+1;
      }
      else if(i==req.input.length-1){
        s.push(req.input.substring(j,req.input.length));
      }
    }
    return Evaluation.evaluate(s);
  }
}