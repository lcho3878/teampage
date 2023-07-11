import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

// 팀원 등록 페이지
class MemberAdd extends StatefulWidget {
  const MemberAdd({Key? key}) : super(key: key);

  @override
  _MemberAddState createState() => _MemberAddState();
}

class _MemberAddState extends State<MemberAdd> {
  PickedFile? _image; // 이미지 파일 저장할 변수
  final ImagePicker _picker = ImagePicker();
  // 텍스트 필드의 컨트롤러들
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _advantageController = TextEditingController();
  TextEditingController _collaborationStyleController = TextEditingController();
  TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    // 컨트롤러해제.
    _nameController.dispose();
    _mbtiController.dispose();
    _advantageController.dispose();
    _collaborationStyleController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  // 텍스트 필드 초기화 시키기
  void _clearImageAndTextFields() {
    _nameController.clear();
    _mbtiController.clear();
    _advantageController.clear();
    _collaborationStyleController.clear();
    _urlController.clear();
    setState(() {
      _image = null;
    });
  }

  // 이미지 선택 다이얼로그 표시
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('이미지 선택'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('갤러리에서 선택'),
                  onTap: () {
                    _getImage(ImageSource.gallery); // 갤러리에서 이미지 선택
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Text('카메라로 촬영'),
                  onTap: () {
                    _getImage(ImageSource.camera); // 카메라로 이미지 촬영
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 이미지 선택 및 촬영 처리하는거
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(
      () {
        if (pickedFile != null) {
          _image = PickedFile(pickedFile.path);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('팀원 등록 하기'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                String name = _nameController.text;
                String mbti = _mbtiController.text;
                String advantage = _advantageController.text;
                String collaborationStyle = _collaborationStyleController.text;
                String url = _urlController.text;

                if (name.isEmpty &&
                    mbti.isEmpty &&
                    advantage.isEmpty &&
                    collaborationStyle.isEmpty &&
                    url.isEmpty) {
                  // 모든 텍스트 필드가 비어있을 때 이전화면으로 돌아가기
                  Navigator.of(context).pop();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('삭제 확인'),
                        content: Text('정말로 삭제하시겠습니까?'),
                        actions: [
                          TextButton(
                            child: Text('취소'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('삭제'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _clearImageAndTextFields();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          // 오버플로우 안나게
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showImageSourceDialog(); // 이미지선택하는 다이얼로그
                    },
                    child: Container(
                      // 회색 직사각형
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // 모서리 곡률
                        color: Colors.grey,
                        image: _image != null
                            ? DecorationImage(
                                image: FileImage(File(_image!.path)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _image == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt, // 카메라 아이콘
                                  size: 58,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '사진 등록',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          '이   름    :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'MBTI   :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _mbtiController,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          '장   점   :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _advantageController,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          '협   업       스타일   :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _collaborationStyleController,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'U R L   :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _urlController,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
