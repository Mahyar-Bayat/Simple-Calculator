import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool icon1 = false;
  bool icon2 = false;

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          '$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: const CircleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Calculator's Display

            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                '$text',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: IconButton(
                      icon: Icon(
                        Icons.history_outlined,
                        color: icon1 ? const Color(0xff33691E) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          icon1 = true;
                          icon2 = false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: IconButton(
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: icon2 ? const Color(0xff33691E) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          icon1 = false;
                          icon2 = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.white.withOpacity(0.4))),
                ),
                width: MediaQuery.of(context).size.width - 50,
                height: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here Buttons Function Will Be Called
                calcbutton('AC', const Color(0xff212121), Colors.red),
                calcbutton('( )', const Color(0xff212121), Colors.amber),
                calcbutton('%', const Color(0xff212121), Colors.amber),
                calcbutton('÷', const Color(0xff212121), Colors.amber),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here Buttons Function Will Be Called
                calcbutton('7', const Color(0xff212121), Colors.white),
                calcbutton('8', const Color(0xff212121), Colors.white),
                calcbutton('9', const Color(0xff212121), Colors.white),
                calcbutton('×', const Color(0xff212121), Colors.amber),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here Buttons Function Will Be Called
                calcbutton('4', const Color(0xff212121), Colors.white),
                calcbutton('5', const Color(0xff212121), Colors.white),
                calcbutton('6', const Color(0xff212121), Colors.white),
                calcbutton('-', const Color(0xff212121), Colors.amber),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here Buttons Function Will Be Called
                calcbutton('1', const Color(0xff212121), Colors.white),
                calcbutton('2', const Color(0xff212121), Colors.white),
                calcbutton('3', const Color(0xff212121), Colors.white),
                calcbutton('+', const Color(0xff212121), Colors.amber),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here Buttons Function Will Be Called
                calcbutton('+/-', const Color(0xff212121), Colors.amber),
                calcbutton('0', const Color(0xff212121), Colors.white),
                calcbutton('.', const Color(0xff212121), Colors.amber),
                calcbutton('=', const Color(0xff33691E), Colors.white),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  dynamic text = '';
  double num1 = 0;
  double num2 = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '';
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == '×') {
        finalResult = mul();
      } else if (preOpr == '÷') {
        finalResult = div();
      } else if (preOpr == '%') {
        finalResult = per();
      } else if (preOpr == '( )') {
        finalResult = bra();
      } else if (preOpr == '.') {
        finalResult = dub();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '×' ||
        btnText == '÷' ||
        btnText == '=' ||
        btnText == '%' ||
        btnText == '( )' ||
        btnText == '.') {
      if (num1 == 0) {
        num1 = double.parse(result);
      } else {
        num2 = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == '×') {
        finalResult = mul();
      } else if (opr == '÷') {
        finalResult = div();
      }else if (opr == '%') {
        finalResult = per();
      } else if (opr == '( )') {
        finalResult = bra();
      } else if (opr == '.') {
        finalResult = dub();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = num1 / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String per(){
    result = (num1 / 100).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String bra(){
    result = (num1 / 100).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String dub(){
    result = (num1 + (num2/10)).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

// calcute(String opp, int num1, int num2) {
//   switch (opp) {
//     case '+':
//       {
//         int result = 0;
//         result = num1+num2;
//       finalResult =result.toString();
//       }
//       break;
//     case '-':{}
//   }
// }
}
