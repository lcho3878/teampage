import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

// 팀소개 페이지
class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          '또래또래를 소개합니다',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://gather.town/images/site/site_preview.png',
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 70,
              child: Card(
                child: Center(
                  child: Text(
                    '팀 목표 : 프로젝트 끝까지 잘 마무리하기!',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.pink.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    '팀 특징 : 비슷한 또래들끼리 모여 또래또래가 되었다.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Color.fromARGB(255, 129, 229, 170),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '우리팀 약속',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '• Git Merge는 매일 6시에 하기',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '• 식사시간은 점심 PM 1:00, 저녁 PM 6:00',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '• 매일 2시간 이상 수강 및 복습 후 팀프로젝트 참여하기',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.blue.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 팀원 소개 페이지
class TeamMember extends StatelessWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팀원 소개'),
      ),
      body: Text('팀원을 등록해주세요'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MemberAdd()),
          );
        },
        backgroundColor: Color(0xFFFF7E36),
        elevation: 1,
        child: Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
    );
  }
}

//팀원 등록 페이지
class MemberAdd extends StatelessWidget {
  const MemberAdd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이곳은 팀원 등록 페이지입니다'),
      ),
    );
  }
}

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

//팀원 정보 수정 페이지
class MemberAdjust extends StatelessWidget {
  const MemberAdjust({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('이곳은 팀원 정보 수정 페이지입니다'),
          ],
        ),
      ),
    );
  }
}
