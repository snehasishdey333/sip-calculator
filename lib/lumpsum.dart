import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LumpSum_Page extends StatefulWidget {
  const LumpSum_Page({Key? key}) : super(key: key);

  @override
  _LumpSum_PageState createState() => _LumpSum_PageState();
}

class _LumpSum_PageState extends State<LumpSum_Page> {
  TextEditingController P = TextEditingController();
  TextEditingController r = TextEditingController();
  TextEditingController t = TextEditingController();

  double value = 1;
  var estimatedGrowthh = "";
  var amountInvestedd = "";
  int v = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "LUMPSUM Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Invested Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("What is Mutual Funds ?"),
                                  content: Text(
                                      "Mutual fund is a mechanism for pooling the resources by issuing units to the investors and investing funds in securities in accordance with objectives as disclosed in offer document.Investments in securities are spread across a wide cross-section of industries and sectors and thus the risk is reduced. Diversification reduces the risk because all stocks may not move in the same direction in the same proportion at the same time. Mutual fund issues units to the investors in accordance with quantum of money invested by them. Investors of mutual funds are known as unitholders.The profits or losses are shared by the investors in proportion to their investments. The mutual funds normally come out with a number of schemes with different investment objectives which are launched from time to time. A mutual fund is required to be registered with Securities and Exchange Board of India (SEBI) which regulates securities markets before it can collect funds from the public."),
                                );
                              });
                        },
                        child: Text(
                          "What is \nMutual Funds?",
                          style: TextStyle(
                            backgroundColor: Colors.red[100],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                TextField(
                  controller: P,
                  decoration: const InputDecoration(
                    prefixText: "Rs.",
                    labelText: "Enter Your Amount",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Expected Gain % (Per Year)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                TextField(
                  controller: r,
                  decoration: const InputDecoration(
                    suffixText: "%",
                    labelText: "Enter The Percentage",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Tenure",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "1",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: value.toDouble(),
                        min: 1,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                            v = value.toInt();
                          });
                        },
                        label: value.round().toString(),
                        divisions: 49,
                      ),
                    ),
                    const Text(
                      "50",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        estimatedGrowthh = estimatedGrowth();
                        amountInvestedd = amountInvested();
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("${estimatedGrowthh}",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text(
                  "${amountInvestedd}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String estimatedGrowth() {
    double investedCap = double.parse(P.text);
    double expectedGain = double.parse(r.text);
    int tenure = v;

    double growth = (investedCap) * pow(tenure, (1 + (expectedGain / 100)));
    int growthAmt = growth.toInt();

    return "Estimated Growth : " + "${growthAmt}";
  }

  String amountInvested() {
    double investedCap = double.parse(P.text);
    double expectedGain = double.parse(r.text);
    int tenure = v;

    double invested = (investedCap * tenure);
    int investedAmt = invested.toInt();

    return "Amount Invested  : " + "${investedAmt}";
  }
}
