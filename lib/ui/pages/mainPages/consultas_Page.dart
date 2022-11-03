import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/pages/consultasPages/query_people.dart';
import 'package:sgsp_app/ui/pages/consultasPages/query_police_report.dart';
import 'package:sgsp_app/ui/pages/consultasPages/query_vehicles.dart';

class ConsultasPage extends StatelessWidget {
  const ConsultasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.people),
                ),
                Tab(icon: Icon(Icons.drive_eta)),
                Tab(icon: Icon(Icons.policy))
              ],
            ),
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.76,
              child: TabBarView(
                children: [
                  Search_person_Page(),
                  Search_vehicle_Page(),
                  Search_police_report_Page()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
