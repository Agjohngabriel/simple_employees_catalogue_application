import 'package:flutter/material.dart';
import 'package:simple_employees_catalogue_application/presentation/StaffScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _isObscure = true;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color.fromRGBO(212, 218, 218,  0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello Again!", style: TextStyle(color: Colors.black, fontSize: 22,), textAlign: TextAlign.center,),
            Text("Welcome back, you have been  confirmed!", style: TextStyle(color: Colors.black, fontSize: 18,), textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TextFormField(
                onChanged: (String value) {
                },
                textInputAction: TextInputAction.next,
                controller: usernameController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TextFormField(
                onChanged: (String value) {
                },
                textInputAction: TextInputAction.next,
                controller: passwordController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          if(_isObscure==false){
                            _isObscure=true;
                          }else{
                            _isObscure = false;
                          }
                        });
                      },
                      child: Icon(
                        _isObscure==false?Icons.visibility_rounded:Icons.visibility_off_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    hintText: _isObscure==false?"Password":"**********",
                    hintStyle: const TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isObscure==true?true:false,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
                onTap: (){

                },
                child: Text("Remember Password", style: TextStyle(color: Colors.black, fontSize: 13,), textAlign: TextAlign.end,)
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  primary: Colors.red
              ) ,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StaffScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18,), textAlign: TextAlign.center,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            // TODO
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //
            // )
            Text("Or use social media", style: TextStyle(color: Colors.black, fontSize: 15,), textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){

                    } ,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 60,
                      padding: EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width:  3,),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Image.asset("assets/google.png", fit: BoxFit.contain,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap:(){

                      } ,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 60,
                        padding: EdgeInsets.all(7.5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width:  3,),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Image.asset("assets/apple-logo.png", fit: BoxFit.contain,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){

                    } ,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 60,
                      padding: EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width:  3,),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Image.asset("assets/facebook.png", fit: BoxFit.contain,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("New to the App? ", style: TextStyle(color: Colors.black, fontSize: 15,), textAlign: TextAlign.center,),
                InkWell(onTap: (){}, child: Text("Regiister Here", style: TextStyle(color: Colors.blue, fontSize: 15,), textAlign: TextAlign.center,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
