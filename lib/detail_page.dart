//팀원 등록 페이지
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';
import 'package:image_picker/image_picker.dart';

class MemberDetail extends StatefulWidget {
  const MemberDetail({Key? key, required this.memberList, required this.index})
      : super(key: key);
  final List<Enroll> memberList;
  final int index;

  @override
  State<MemberDetail> createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
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
                  child: Text('사진에서 선택'),
                  onTap: () {
                    _getImage(ImageSource.gallery); // 사진앱에서 이미지 선택
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
    EnrollService enrollService = context.read<EnrollService>();
    Enroll enroll = enrollService.memberList[widget.index];

    nameController.text = enroll.name;
    mbtiController.text = enroll.mbti;
    advController.text = enroll.advantage;
    stlController.text = enroll.style;
    urlController.text = enroll.url;

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
            actions: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.delete),
                onPressed: () {
                  _showDeleteDialog(enrollService);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                GestureDetector(
                  // 수정 페이지에서 사진 변경하는 기능은 추후 구현 예정
                  // onTap: () {
                  //   _showImageSourceDialog(); // 이미지선택하는 다이얼로그
                  //   // enroll.imagepath = _image!.path;
                  // },
                  child: Container(
                    child: _image != null
                        ? Image.file(File(_image!.path))
                        : enroll.imagepath == ""
                            ? Image.asset(
                                'images/noimage.png',
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                enroll.imagepath,
                                fit: BoxFit.cover,
                              ),
                    // 회색 직사각형
                    width: 200,
                    height: 250,
                  ),
                  onTap: _showImageSourceDialog,
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
                                    hintText: '블로그 URL',
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
                            String imagepath;
                            _image != null
                                ? imagepath = _image!.path
                                : imagepath = enroll.imagepath;
                            enrollService.saveMember(
                                index: widget.index,
                                name: nameController.text,
                                mbti: mbtiController.text,
                                advantage: advController.text,
                                style: stlController.text,
                                url: urlController.text,
                                imagepath: imagepath);
                            Navigator.pop(context);
                          },
                          child: Text("저장"),
                        ),
                      ),
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

  void _showDeleteDialog(EnrollService enrollService) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('이 멤버를 삭제하시겠습니까?'),
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
                enrollService.deleteMember(widget.index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
