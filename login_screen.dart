import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  var tfKullaniciadi = TextEditingController();
  var tfSifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfKullaniciadi,
                      decoration: InputDecoration(
                        hintText: "Kullanıcı Adı",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Kullanıcı adı giriniz";
                        }
                        return null;
                      },
                    ),
                    spacer(),
                    TextFormField(
                      controller: tfSifre,
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                        hintText: "Şifre",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Şifre giriniz";
                        }

                        if (tfgirdisi.length < 6) {
                          return "Şifreniz en az 6 haneli olmalıdır";
                        }

                        return null;
                      },
                    ),
                    spacer(),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(child: Text("GİRİŞ")),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.black12, width: 1)),
                      ),
                      onTap: () {
                        bool kontrolSonucu = formKey.currentState!.validate();

                        if (kontrolSonucu) {
                          String ka = tfKullaniciadi.text;
                          String s = tfSifre.text;
                          print("Kullanıcı adı : $ka - Şifre : $s");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox spacer() {
    return SizedBox(
      height: 30,
    );
  }
}
