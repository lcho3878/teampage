// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        title: Text('팀 소개합니다'),
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
        backgroundColor: Colors.white,
        title: Text(
          "정보",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back), // 햄버거버튼 아이콘 생성
          onPressed: () {
            // 아이콘 버튼 실행
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.delete), // 장바구니 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print('Shopping cart button is clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 130),
          child: Column(
            children: [
              Container(
                child: Row(children: <Widget>[
                  Container(
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("이름 : ",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '이름을 입력하세요',
                            hintStyle: TextStyle(color: Colors.grey[300])),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                child: Row(children: <Widget>[
                  Container(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("MBTI : ",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'MBTI 입력하세요',
                            hintStyle: TextStyle(color: Colors.grey[300])),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                child: Row(children: <Widget>[
                  Container(
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("장점 : ",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '장점을 입력하세요',
                            hintStyle: TextStyle(color: Colors.grey[300])),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                child: Row(children: <Widget>[
                  Container(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("협업스타일 : ",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ex) 경청',
                            hintStyle: TextStyle(color: Colors.grey[300])),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                child: Row(children: <Widget>[
                  Container(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        "블로그 : ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '블로그 url',
                            hintStyle: TextStyle(color: Colors.grey[300])),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  width: 140,
                  height: 35,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("등록"),
                  )),
            ],
          ),
        ),
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
        title: Text('이곳은 팀원 정보 수정 페이지입니다'),
      ),
    );
  }
}
