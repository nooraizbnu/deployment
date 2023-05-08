import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/contributorside/AdminEarnings.dart';
import 'package:procollab_web/contributorside/OPHome.dart';
import 'package:procollab_web/contributorside/earninghome.dart';
import 'package:procollab_web/contributorside/getallposts.dart';
import 'package:procollab_web/profile/offeredcollaborations.dart';
import 'package:procollab_web/profile/payable.dart';

class ContributorTabs extends StatefulWidget {
  const ContributorTabs({Key? key}) : super(key: key);

  @override
  State<ContributorTabs> createState() => _ContributorTabsState();
}

class _ContributorTabsState extends State<ContributorTabs> {
  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF5364B8);
    const secondaryColor = Color(0xFF3F83B4);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white30,
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: mainColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ONGOING PROJECTS", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("COMPLETED PROJECTS", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("EARNINGS", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SizedBox(child: OPHome()),
              SizedBox(child: Home()),
              SizedBox(child: SPPEarnings()),
            ],
          ),
        ),
      ),
    );
  }
}
