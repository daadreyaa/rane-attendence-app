import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';
import 'package:rane_mobile_app/utils/data.dart';

import '../components/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String id = "profile_screen";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late TextEditingController textController6;
  late TextEditingController textController7;
  late TextEditingController textController8;

  String? fullname = '';
  String? department = '';
  String? empId = '';
  String? doj = '';
  String? dob = '';
  String? designation = '';
  String? email = '';
  String? contactNumber = '';

  bool showSpinner = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
    textController8 = TextEditingController();
    getValues();
  }

  void getValues() async {
    ApiCalls.getProfile(Data.userBiometric).then((profileData) {
      print(profileData);
      if (profileData != null) {
        fullname = profileData['fullname'];
        department = profileData['dept'].toString();
        empId = profileData['apln'].toString();
        doj = profileData['doj'];
        dob = profileData['birthdate'];
        designation = profileData['desig'].toString();
        contactNumber = profileData['mobile_no1'];
        setState(() {});
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: kAppbarTextColor,
        title: Text(
          "My Profile",
          style: kHeadingText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 135,
                width: 135,
                child: const Hero(
                  tag: 'profile-photo',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.iwmbuzz.com/wp-content/uploads/2021/07/5-times-alexandra-daddario-left-netizens-lovestruck-in-cute-smiles-grey-eyes-3.jpg',
                    ),
                    radius: 60,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffefeeee),
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffefeeee),
                      Color(0xffefeeee),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffffffff),
                      offset: Offset(-20.0, -20.0),
                      blurRadius: 30,
                      spreadRadius: 0.0,
                    ),
                    BoxShadow(
                      color: Color(0xffd1d0d0),
                      offset: Offset(20.0, 20.0),
                      blurRadius: 30,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileField(
              textController1: textController1,
              enable: false,
              labelText: 'Name',
              initValue: fullname.toString(),
            ),
            ProfileField(
              textController1: textController2,
              enable: false,
              labelText: 'Department',
              initValue: department.toString(),
            ),
            ProfileField(
              textController1: textController3,
              enable: false,
              labelText: 'Emp id',
              initValue: empId.toString(),
            ),
            ProfileField(
              textController1: textController4,
              enable: false,
              labelText: 'Date of joining',
              initValue: doj.toString(),
            ),
            ProfileField(
              textController1: textController5,
              enable: false,
              labelText: 'Date of birth',
              initValue: dob.toString(),
            ),
            ProfileField(
              textController1: textController6,
              enable: false,
              labelText: 'Designation',
              initValue: designation.toString(),
            ),
            ProfileField(
              textController1: textController7,
              enable: false,
              labelText: 'Email',
              initValue: email.toString(),
            ),
            ProfileField(
              textController1: textController8,
              enable: false,
              labelText: 'Contact Number',
              initValue: contactNumber.toString(),
            ),
            // RoundedButton(
            //   title: "Save Changes",
            //   color: kRoyaleBlue,
            //   onPressed: null,
            //   fontSize: 18,
            // )
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  ProfileField({
    Key? key,
    required this.textController1,
    required this.enable,
    required this.labelText,
    required this.initValue,
  }) : super(key: key);

  final TextEditingController textController1;
  late bool enable;
  late String labelText;
  late String initValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
      child: TextFormField(
        enabled: enable,
        controller: textController1..text = initValue,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.lexendDeca(
            color: const Color(0xFF95A1AC),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Enter your $labelText',
          hintStyle: GoogleFonts.lexendDeca(
            color: const Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 14, 0, 14),
        ),
        style: GoogleFonts.lexendDeca(
          color: const Color(0xFF14181B),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
