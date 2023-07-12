import 'package:flutter/material.dart';
import 'package:teampage/teamMember_page.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          //(1)
          tabs: <Widget>[
            Tab(icon: Icon(Icons.people), text: "팀"),
            Tab(
              icon: Icon(Icons.person),
              text: "팀원",
            ),
          ],
          indicatorColor: Colors.transparent, // indicator 없애기
          unselectedLabelColor: Colors.grey, // 선택되지 않은 tab 색
          labelColor: Colors.black, // 선택된 tab의 색
        ),
        body: TabBarView(
          children: <Widget>[
            Tab(
              child: Team(),
            ),
            Tab(
              child: TeamMember(),
            ),
          ],
        ),
      ),
    );
  }
}

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '팀 소개합니다',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // 연습
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       Image.asset("assets/images/8team.png"),
      //       Container(
      //         margin: EdgeInsets.only(top: 20),
      //         child: Text(
      //           "팀 목표 : 개발자가 되고 싶습니다.",
      //           style: TextStyle(
      //             fontSize: 26,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.purpleAccent,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.cyanAccent,
      //         margin: EdgeInsets.all(20),
      //         padding: EdgeInsets.all(10),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Text(
      //               "팀 특징",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.all(10),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 children: [
      //                   Text("* 조곤조곤"),
      //                   Text("* 소통에 조심성 있음"),
      //                   Text("* 배려심 깊음"),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Text(
      //               "우리 팀 약속",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 children: [
      //                   Text("* 식사 시간은 점심 13시, 저녁 18시"),
      //                   Text("* 매일 2시간 이상 수강 및 복습 후 팀 프로젝트 참여하기"),
      //                   Text("* Git Merge는 매일 6시에 하기"),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
