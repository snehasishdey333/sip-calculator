import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Sip_Page extends StatefulWidget {
  const Sip_Page({Key? key}) : super(key: key);

  @override
  _Sip_PageState createState() => _Sip_PageState();
}

class _Sip_PageState extends State<Sip_Page> {
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
        title: const Center(
            child: Text(
          "SIP Calculator",
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
                      "Monthly SIP Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("What is SIP ?"),
                                  content: Text(
                                      "Systematic Investment Plan (SIP) is an investment route offered by Mutual Funds wherein one can invest a fixed amount in a Mutual Fund scheme at regular intervals– say once a month or once a quarter, instead of making a lump-sum investment. The installment amount could be as little as INR 500 a month and is similar to a recurring deposit. It’s convenient as you can give your bank standing instructions to debit the amount every month."),
                                );
                              });
                        },
                        child: Text(
                          "What is SIP ?",
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
                  "SIP Tenure",
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
    double monthlySip = double.parse(P.text);
    double expectedGain = double.parse(r.text);
    int tenure = v;

    double growth = (12 * monthlySip) * pow(tenure, (1 + (expectedGain / 100)));
    int growthAmt = growth.toInt();

    return "Estimated Growth : " + "${growthAmt}";
  }

  String amountInvested() {
    double monthlySip = double.parse(P.text);
    double expectedGain = double.parse(r.text);
    int tenure = v;

    double invested = (12 * monthlySip * tenure);
    int investedAmt = invested.toInt();

    return "Amount Invested  : " + "${investedAmt}";
  }
}
