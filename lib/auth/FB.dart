// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mos/constant%20and%20config/consstante.dart';
import 'package:mos/screen/homePage.dart';
import 'package:mos/screen/rounded_button.dart';
import 'package:mos/constant%20and%20config/size_config.dart';
import 'package:mos/constant%20and%20config/textfield.dart';

import 'package:sms_autofill/sms_autofill.dart';

typedef OAuthSignIn = void Function();

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Helper class to show a snackbar using the passed context.
class ScaffoldSnackbar {
  // ignore: public_member_api_docs
  ScaffoldSnackbar(this._context);

  /// The scaffold of current context.
  factory ScaffoldSnackbar.of(BuildContext context) {
    return ScaffoldSnackbar(context);
  }

  final BuildContext _context;

  /// Helper method to show a SnackBar.
  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

enum AuthMode { login, register, phone }

class AuthGate extends StatefulWidget {
  bool isforget;
  // ignore: public_member_api_docs
  AuthGate({Key? key, required this.isforget}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';
  String verificationId = '';

  AuthMode mode = AuthMode.phone;

  bool isLoading = false;

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  // late Map<Buttons, OAuthSignIn> authButtons;
  String sms = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(sms);
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
            body: CustomScrollView(

                // physics: NeverScrollableScrollPhysics(),
                slivers: [
              SliverAppBar(
                title: Text(
                  "Verify-otp".tr,
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent, // <-- SEE HERE
                  statusBarIconBrightness:
                      Brightness.dark, //<-- For Android SEE HERE (dark icons)
                  statusBarBrightness: Brightness.light,
                  //<-- For iOS SEE HERE (dark icons)
                ),
                flexibleSpace: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'images/Rectangle2.jpeg',
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'images/Rectangle1.jpeg',
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          Container(
                              width: 150,
                              height: 150,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                        'images/man.jpeg',
                                      )))),
                        ],
                      ),
                    )
                  ],
                ),
                collapsedHeight: Get.size.width * 0.6,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  // color: HexColor('#1C9E54'),
                  color: Colors.black,
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   'Entre phone'.tr,
                                //   style: TextStyle(
                                //       fontSize: 22,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                // SizedBox(
                                //   height:
                                //       SizeConfig.getProportionateScreenHeight(
                                //           10),
                                // ),
                                // Text(
                                //   'new-password-note'
                                //       .tr,
                                //   style: TextStyle(
                                //       fontSize: 14, color: Colors.grey),
                                // ),
                                SizedBox(height: 40),
                                Text(
                                  'phone-number'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                TextFormInput(
                                  // filledColor: _changeController.erro,
                                  controller: phoneController,
                                  hintText: 'phone-number'.tr,
                                  obsecure: false,
                                  number: true,
                                  preffixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey[400],
                                  ),
                                  validator: (val) => (val!.length <= 0
                                      ? 'enter-valid-number'.tr
                                      : null),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: isLoading
                                      ? Image.asset(
                                          'images/loding2.jpeg',
                                          width: Get.size.width * 0.8,
                                          height: Get.size.height * 0.1,
                                        )
                                      : RoundedButton(
                                          onTap: () {
                                            if ((formKey.currentState!
                                                .validate())) {
                                              _handleMultiFactorException(
                                                _emailAndPassword,
                                              );
                                            } else {
                                              setState(() {
                                                // _changeController.erro = true;
                                              });
                                            }
                                          },
                                          title: 'confirm'.tr),
                                ),
                                SizedBox(
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ])));
  }

  Future<void> _handleMultiFactorException(
    Future<void> Function() authFunction,
  ) async {
    setIsLoading();
    try {
      await authFunction();
    } on FirebaseAuthMultiFactorException catch (e) {
      setState(() {
        error = '${e.message}';
      });
      print("error: ${error}");
      final firstHint = e.resolver.hints.first;
      if (firstHint is! PhoneMultiFactorInfo) {
        return;
      }
      final auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        multiFactorSession: e.resolver.session,
        multiFactorInfo: firstHint,
        verificationCompleted: (_) {},
        verificationFailed: print,
        codeSent: (String verificationId, int? resendToken) async {
          final smsCode = await getSmsCodeFromUser(context);

          if (smsCode != null) {
            // Create a PhoneAuthCredential with the code
            final credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: smsCode,
            );

            try {
              await e.resolver.resolveSignIn(
                PhoneMultiFactorGenerator.getAssertion(
                  credential,
                ),
              );
            } on FirebaseAuthException catch (e) {
              print(e.message);
            }
          }
        },
        codeAutoRetrievalTimeout: print,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = '${e.message}';
      });
    } catch (e) {
      setState(() {
        error = '$e';
      });
    } finally {
      setIsLoading();
    }
  }

  Future<void> _emailAndPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      setIsLoading();

      await _phoneAuth();
    }
  }

  Future<void> _phoneAuth() async {
    if (mode != AuthMode.phone) {
      setState(() {
        mode = AuthMode.phone;
      });
    } else {
      if (kIsWeb) {
        final confirmationResult =
            await _auth.signInWithPhoneNumber('+222 ${phoneController.text}');
        final smsCode = await getSmsCodeFromUser(context);

        if (smsCode != null) {
          await confirmationResult.confirm(smsCode);
          setIsLoading();
        }
      } else {
        await _auth.verifyPhoneNumber(
          phoneNumber: '+222 ${phoneController.text}',
          verificationCompleted: (_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              content: Text("message-seding".tr,
                  style: TextStyle(color: Colors.white)),
            ));
          },
          verificationFailed: (e) {
            setIsLoading();
            setState(() {
              print('e.message.messagee.messagee.messagee.messagee.messagee');
              print(e.message);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                  content: Text('${e.message}'.tr,
                      style: TextStyle(color: Colors.white))));
              error = '${e.message}';
            });
          },
          codeSent: (String verificationId, int? resendToken) async {
            final smsCode = await getSmsCodeFromUser(context);

            if (smsCode != null) {
              // Create a PhoneAuthCredential with the code
              final credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: smsCode,
              );

              try {
                // Sign the user in (or link) with the credential
                print('OK');
                await _auth.signInWithCredential(credential);
                Get.to(homePage());
              } on FirebaseAuthException catch (e) {
                setState(() {
                  error = e.message ?? '';
                });
                setIsLoading();
                setState(() {
                  print(
                      'e.message.messagee.messagee.messagee.messagee.messagee');
                  print(e.message);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      content: Text('${e.message}'.tr,
                          style: TextStyle(color: Colors.white))));
                  error = '${e.message}';
                });
              }
            }
          },
          codeAutoRetrievalTimeout: (e) {
            setState(() {
              error = e;
            });
          },
        );
      }
    }
  }
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  await SmsAutoFill().listenForCode;

  String? smsCode;
  TextEditingController l = TextEditingController(text: smsCode);

  // Update the UI - wait for the user to enter the SMS code
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text('sms-code'.tr),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: RoundedButton(
              onTap: () => Navigator.of(context).pop(),
              title: 'check'.tr,
            ),
          ),
        ],
        content: TextFieldPinAutoFill(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor('#9CA3AF')),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: redcolor),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: redcolor),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor('#9CA3AF')),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

              // hintText: '',
              contentPadding: EdgeInsets.only(
                  right: SizeConfig.getProportionateScreenWidth(10),
                  left: SizeConfig.getProportionateScreenWidth(15),
                  top: SizeConfig.getProportionateScreenWidth(32)),
              fillColor: Colors.white,
              filled: true,
            ),
            onCodeChanged: (p0) {
              smsCode = p0;
              print(
                  "p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0");
              print(p0);
              print('_________________++++++++++++++++++++++++++++++++');
            },
            onCodeSubmitted: (p0) {
              smsCode = p0;
              l.text = p0;
              print(
                  "p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0p0");
              print(p0);
              print('_________________++++++++++++++++++++++++++++++++');
            } //code length, default 6
            ),
      );
    },
  );

  return smsCode;
}
