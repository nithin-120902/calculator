import 'package:calculator/elements.dart';

import 'package:calculator/response.dart';

class Evaluation {

  static List<int> findTheIndexOfOpr(List<String> c, String opr1, String opr2) {
    List<int> index = [];
    for (int i = 0; i < c.length; i++) {
      if (c[i] == opr1 || c[i] == opr2) {
        index.add(i);
      }
    }
    return index;
  }

  static Response evaluate(Elements s) {
    List<int> indexs = [];
    List<String> c = s.e;
    double result;
    for (int i = 0; i < 2; i++) {
      if (i == 0) {
        indexs = findTheIndexOfOpr(c, '/', '*');
        while (indexs.isNotEmpty) {
          int index = indexs.removeAt(0);
          if (c[index] == '/') {
            double a = double.parse(c.removeAt(index - 1));
            c.removeAt(index - 1);
            double b = double.parse(c.removeAt(index - 1));
            if(b==0.0){
              return Response(output: "Undefined");
            }
            result = (a / b);
            c.insert(index - 1, result.toString());
          } else if (c[index] == '*') {
            double a = double.parse(c.removeAt(index - 1));
            c.removeAt(index - 1);
            double b = double.parse(c.removeAt(index - 1));
            result = (a * b);
            c.insert(index - 1, result.toString());
          }
          for (int i = 0; i < indexs.length; i++) {
            indexs[i] = indexs[i] - 2;
          }
        }
      } else {
        indexs = findTheIndexOfOpr(c, '+', '-');
        while (indexs.isNotEmpty) {
          int index = indexs.removeAt(0);
          if (c[index] == '+') {
            double a = double.parse(c.removeAt(index - 1));
            c.removeAt(index - 1);
            double b = double.parse(c.removeAt(index - 1));
            result = (a + b);
            c.insert(index - 1, result.toString());
          } else if (c[index] == '-') {
            double a = double.parse(c.removeAt(index - 1));
            c.removeAt(index - 1);
            double b = double.parse(c.removeAt(index - 1));
            result = (a - b);
            c.insert(index - 1, result.toString());
          }
          for (int i = 0; i < indexs.length; i++) {
            indexs[i] = indexs[i] - 2;
          }
        }
      }
    }
    return Response(output: c.removeAt(0));
  }
}
