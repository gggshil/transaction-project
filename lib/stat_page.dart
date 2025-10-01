import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}



class _StatPageState extends State<StatPage> {
  bool test = false;
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            
          },
          icon: Icon(Icons.chevron_left, size: 30),
        ),
        title: Text("Statistic", style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          tabs: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("income", style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("outcome", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 80,
                        sections: [
                          PieChartSectionData(
                            color: Colors.pink,
                            value: 17,
                            title: '',
                            titleStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color.fromARGB(255, 39, 76, 176),
                            value: 15,
                            title: "",
                            titleStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color.fromARGB(255, 44, 176, 39),
                            value: 18,
                            title: "",

                            titleStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color.fromARGB(255, 132, 141, 132),
                            value: 50,
                            title: "",
                            titleStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "TOTAL INCOME",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "\$20,17,300",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Income Breakdown",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              color: Colors.white,
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Monthly Salary",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  Text("\$10,086.50", style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 20,
                      width: 35,
                      color: Colors.grey,
                      child: Center(child: Text("50%")),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Passive Income",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  Text("\$3,631.14", style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 20,
                      width: 35,
                      color: const Color.fromARGB(255, 44, 176, 39),
                      child: Center(child: Text("18%")),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Freelance", style: TextStyle(fontSize: 16)),
                  ),

                  Text("\$3,429.41", style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 20,
                      width: 35,
                      color: Colors.pink,
                      child: Center(child: Text("17%")),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Side Business",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  Text("\$3,025.95", style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 20,
                      width: 35,
                      color: const Color.fromARGB(255, 39, 76, 176),
                      child: Center(child: Text("15%")),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
