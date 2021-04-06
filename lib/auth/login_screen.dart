import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';

import '../app_localizations.dart';
import 'number_verification.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  var phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).translate('mobile_number'),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    child: TextField(
                      controller: _countryCodeController,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: '964',
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.grey[500]),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 30,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: AppLocalizations.of(context)
                            .translate('phone_number'),
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.grey[500]),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
              ),
              Button1(
                label: 'Next',
                onPressed: () {
                  if (_countryCodeController.text.isNotEmpty &
                      _controller.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          phoneNumber =
                              '+${_countryCodeController.text}${_controller.text}';
                          return NumberVerification(
                            phoneNumber: phoneNumber,
                          );
                        },
                      ),
                    );
                  } else {
                    return SnackBar(
                      content: Text('Invalid Phone Number'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
      //   child: Row(
      //     children: [
      //       GestureDetector(
      //         child: Text(
      //           'Click here ',
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //             color: MyColors.blue1,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return NumberVerification();
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //       Text(
      //         'to register if you are new to Saydo',
      //         style: TextStyle(
      //           fontSize: 16,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
