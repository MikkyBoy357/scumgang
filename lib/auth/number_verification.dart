import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:saydo/app_localizations.dart';
import 'package:saydo/auth/login_screen.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/screens/home/main_screen.dart';

class NumberVerification extends StatefulWidget {
  final phoneNumber;

  const NumberVerification({Key key, this.phoneNumber}) : super(key: key);

  @override
  _NumberVerificationState createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _verifyPhone() async {
    print("phone: ${widget.phoneNumber}");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            print('User Logged In');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ),
            );
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationID, int resendToken) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      timeout: Duration(minutes: 5),
    );
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context).translate('enter_otp'),
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                Text(
                  '${widget.phoneNumber}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20,
                ),
                // Container(
                //   width: 200,
                //   child: TextField(
                //     maxLength: 6,
                //     textAlign: TextAlign.center,
                //     decoration: InputDecoration(
                //       counterText: '',
                //       hintText: '000000',
                //       hintStyle: TextStyle(
                //         fontSize: 20,
                //         color: Colors.grey,
                //       ),
                //     ),
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  child: PinPut(
                    fieldsCount: 6,
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(.5),
                      ),
                    ),
                    onSubmit: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode,
                                smsCode: pin))
                            .then((value) async {
                          if (value.user != null) {
                            print('Pass to home');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainScreen();
                                },
                              ),
                            );
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Invalid OTP')));
                        print(e);
                      }
                    },
                  ),
                ),
                Container(
                  height: 50,
                ),
                Button1(
                  label: AppLocalizations.of(context).translate('login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ),
                    );
                  },
                ),
                Container(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context).translate('no_otp'),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 5.0,
                ),
                GestureDetector(
                  child: Text(
                    AppLocalizations.of(context).translate('resend_otp'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blue1,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
