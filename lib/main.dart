import 'package:flutter/material.dart';
import 'package:teampage/teampage.dart';

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

// 팀원 소개 페이지
class TeamMember extends StatefulWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  List name = ['노진구', '도라에몽', '도라미'];
  List hobby = ['이슬이', '단팥빵', '집안일'];
  List imgUrl = [
    'https://w7.pngwing.com/pngs/1010/781/png-transparent-doraemon-nobita-character-nobita-nobi-doraemon-character-youtube-real-life-doraemon-television-child-hand.png',
    'https://img.extmovie.com/files/attach/images/174/500/322/005/b8a36bfbe9ab62a7e89ff08505d49adf.png',
    'https://i.namu.wiki/i/vHdDMJ9YXTWSDhLKE4iy9bvIlzKgJPnXxfWKgAB5cTxS1ssE5ygBllWIX_fSvUVIR7dYfP-6jccPdnStCwMr9w.webp',
  ];
  List mbti = ['ISTP', 'ENFJ', 'ESTP'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '팀원 소개',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: name.isEmpty
          ? Center(
              child: Text(
                '팀원을 등록해주세요',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 240,
                  child: Row(
                    children: [
                      Container(
                        height: 240,
                        width: 180,
                        child: GestureDetector(
                          child: Image.network(
                            imgUrl[index],
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MemberDetail(
                                  index: index,
                                  hobby: hobby,
                                  imgUrl: imgUrl,
                                  mbti: mbti,
                                  name: name,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('이름 : ${name[index]}'),
                          Text('MBTI : ${mbti[index]}'),
                          Text('좋아하는 것 : ${hobby[index]}'),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
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
        leading: IconButton(
          icon: Icon(
            Icons.backspace,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '팀원 추가하기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('저장하겠습니까?'),
                  );
                },
              );
            },
            child: Text(
              '저장',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
    );
  }
}

//팀원 상세 설명 페이지
class MemberDetail extends StatelessWidget {
  const MemberDetail(
      {Key? key,
      required this.name,
      required this.hobby,
      required this.imgUrl,
      required this.mbti,
      required this.index})
      : super(key: key);
  final int index;
  final List name;
  final List hobby;
  final List imgUrl;
  final List mbti;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name[index]);
    final mbtiController = TextEditingController(text: mbti[index]);
    final hobbyController = TextEditingController(text: hobby[index]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.backspace,
              color: Colors.black,
            )),
        title: Text(
          '팀원 소개',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              imgUrl[index],
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: 400,
          ),
          TextFormField(
            controller: nameController,
          ),
          TextFormField(
            controller: mbtiController,
          ),
          TextFormField(
            controller: hobbyController,
          ),
        ],
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
