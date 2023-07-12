//팀원 등록 페이지
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';
import 'package:image_picker/image_picker.dart';

class MemberAdd extends StatefulWidget {
  const MemberAdd({Key? key, index}) : super(key: key);

  @override
  State<MemberAdd> createState() => _MemberAddState();
}

class _MemberAddState extends State<MemberAdd> {
  PickedFile? _image; // 이미지 파일 저장할 변수
  final ImagePicker _picker = ImagePicker();

  // 텍스트 필드의 컨트롤러
  TextEditingController nameController = TextEditingController();
  TextEditingController mbtiController = TextEditingController();
  TextEditingController advController = TextEditingController();
  TextEditingController stlController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  // 컨트롤러 해제
  @override
  void dispose() {
    nameController.dispose();
    mbtiController.dispose();
    advController.dispose();
    stlController.dispose();
    urlController.dispose();
    super.dispose();
  }

  // 텍스트 필드 초기화 시키기(예시, 삭제예정)
  // void _clearImageAndTextFields() {
  //   // _nameController.clear();
  //   // _mbtiController.clear();
  //   // _advantageController.clear();
  //   // _collaborationStyleController.clear();
  //   // _urlController.clear();
  //   setState(() {
  //     _image = null;
  //   });
  // }

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
    return Consumer<EnrollService>(
      builder: (context, enrollService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "등록",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // 아이콘 버튼 실행
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.delete),
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
                SizedBox(height: 40),
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
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: Text("이름 : ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '이름을 입력하세요',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300])),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: TextField(
                                controller: mbtiController,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'MBTI 입력하세요',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300])),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: TextField(
                                controller: advController,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '장점을 입력하세요',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300])),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: TextField(
                                controller: stlController,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ex) 경청',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300])),
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: TextField(
                                controller: urlController,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '블로그 url',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300])),
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
                            // 저장 기능
                            onPressed: () {
                              enrollService.createMember(
                                name: nameController.text,
                                mbti: mbtiController.text,
                                advantage: advController.text,
                                style: stlController.text,
                                url: urlController.text,
                              );

                              Navigator.pop(context);
                            },
                            child: Text("등록"),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
