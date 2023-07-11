//팀원 등록 페이지

import 'package:flutter/material.dart';

class MemberAdd extends StatefulWidget {
  const MemberAdd({Key? key}) : super(key: key);

  @override
  State<MemberAdd> createState() => _MemberAddState();
}

class _MemberAddState extends State<MemberAdd> {
  List<String> infoList = ['', '', '', '', ''];

  get nameController => null;

  get mbtiController => null;

  get strController => null;

  get colController => null;

  get blogController => null;

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
        child: Column(
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 130),
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 50,
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("이름 : ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextField(
                            onChanged: (text) {
                              infoList[0] = text;
                            },
                            controller: nameController,
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextField(
                            onChanged: (text) {
                              infoList[1] = text;
                            },
                            controller: mbtiController,
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextField(
                            onChanged: (text) {
                              infoList[2] = text;
                            },
                            controller: strController,
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextField(
                            onChanged: (text) {
                              infoList[3] = text;
                            },
                            controller: colController,
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
                            onChanged: (text) {
                              infoList[4] = text;
                            },
                            controller: blogController,
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
          ],
        ),
      ),
    );
  }
}
