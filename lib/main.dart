import 'package:flutter/material.dart';
import 'package:teampage/teamMember.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enroll_service.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EnrollService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamProject',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
// 분리
// // 팀소개 페이지
// class Team extends StatelessWidget {
//   const Team({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('팀 소개합니다'),
//       ),
//     );
//   }
// }

// // 팀원 소개 페이지
// class TeamMember extends StatelessWidget {
//   const TeamMember({Key? key}) : super(key: key);

//팀원 상세 설명 페이지
class MemberDetail extends StatelessWidget {
  const MemberDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이곳은 팀원 등록 페이지입니다'),
      ),
    );
  }
}

// //팀원 정보 수정 페이지
// class MemberAdjust extends StatelessWidget {
//   const MemberAdjust({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('이곳은 팀원 정보 수정 페이지입니다'),
//       ),
//     );
//   }
// }
