// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:intl/intl.dart';
// import 'package:loginuibackend/DBHelper.dart';
// import 'package:loginuibackend/main.dart';
// import 'package:sqflite/sqflite.dart';
//
// class demo1 extends StatefulWidget {
//   const demo1({Key? key}) : super(key: key);
//
//   @override
//   State<demo1> createState() => _demo1State();
// }
//
// class _demo1State extends State<demo1> {
//   Database? db;
//
//   @override
//   void initState() {
//     super.initState();
//     DBHelper().createDatabase().then((value) {
//       db = value;
//     });
//   }
//
//   String fornatdate = "";
//   bool password = false;
//   bool validatepassword = false;
//   bool validateemail = false;
//   bool validateconpassword = false;
//   String pass = "";
//   TextEditingController namecon = TextEditingController();
//   TextEditingController emailcon = TextEditingController();
//   TextEditingController passcon = TextEditingController();
//   TextEditingController conpasscon = TextEditingController();
//   TextEditingController contactcon = TextEditingController();
//   TextEditingController datetime = TextEditingController();
//   String checkboxcon = "";
//
//   String selected_radio = "";
//   List<bool> lang = [false, false, false, false];
//   List<String> lang_name = ["C,C++ ", "Java ", "Dart ", "Flutter "];
//
//   Future<bool> goback() {
//     Navigator.pushReplacement(context, MaterialPageRoute(
//       builder: (context) {
//         return demo();
//       },
//     ));
//     return Future.value();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double swidth = MediaQuery.of(context).size.width;
//     double sheight = MediaQuery.of(context).size.height;
//
//     return WillPopScope(
//       onWillPop: goback,
//       child: Scaffold(
//         appBar: AppBar(
//             title: Text("Creat Contact"),
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(
//                     builder: (context) {
//                       return demo();
//                     },
//                   ));
//                 },
//                 icon: Icon(Icons.arrow_back_ios_new))),
//         backgroundColor: Color(0xff0a0a17),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               height: sheight * .4,
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Image.asset(
//                   "myimg/img.png",
//                   height: sheight / 4,
//                   width: swidth / 2,
//                 ),
//               ),
//             ), //.4
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 30, top: 10),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Form(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 30, top: 10),
//                   child: Text(
//                     "Please sign in to continue",
//                     style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w100),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: swidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   controller: namecon,
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                   ]),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   keyboardType: TextInputType.name,
//                   textCapitalization: TextCapitalization.words,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.person),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Name",
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             Container(
//               width: swidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                     PatternValidator(
//                         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))'
//                         r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
//                         r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
//                         errorText: "Enter Valid Email"),
//                   ]),
//                   autovalidateMode: (AutovalidateMode.always),
//                   keyboardType: TextInputType.name,
//                   textCapitalization: TextCapitalization.words,
//                   // textInputAction: TextInputAction.emergencyCall,
//                   controller: emailcon,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.mail_outline),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Email",
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             Container(
//               width: swidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   onChanged: (value) {
//                     pass = value;
//                   },
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                     PatternValidator(
//                         r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$',
//                         errorText: "Enter Valid Password"),
//                     MinLengthValidator(8,
//                         errorText: 'password must be at least 8 digits long'),
//                   ]),
//                   controller: passcon,
//                   obscureText: !password,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               password = !password;
//                             });
//                           },
//                           icon: Icon(password
//                               ? Icons.visibility
//                               : Icons.visibility_off)),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Password",
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             Container(
//               width: swidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                     PatternValidator(
//                         r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$',
//                         errorText: "Enter Valid Password"),
//                   ]),
//                   controller: conpasscon,
//                   obscureText: !password,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               password = !password;
//                             });
//                           },
//                           icon: Icon(password
//                               ? Icons.visibility
//                               : Icons.visibility_off)),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Confirm Password",
//                       errorText: pass != conpasscon.text
//                           ? "Password doesen't match"
//                           : null,
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             Container(
//               width: swidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   controller: contactcon,
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                     MinLengthValidator(10,
//                         errorText:
//                         'Contact number must be at least 10 digits long'),
//                   ]),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.phone_iphone_outlined),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Contact no.",
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Container(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 150,
//                       child: RadioListTile(
//                         value: 'Male',
//                         groupValue: selected_radio,
//                         title: Text(
//                           "Male",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         onChanged: (val) {
//                           setState(() {
//                             selected_radio = val as String;
//                           });
//                         },
//                         selected: true,
//                         activeColor: Colors.red,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 150,
//                       child: RadioListTile(
//                         value: 'Female',
//                         groupValue: selected_radio,
//                         title: Text(
//                           "Female",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         onChanged: (val) {
//                           setState(() {
//                             selected_radio = val as String;
//                           });
//                         },
//                         activeColor: Colors.red,
//                         selected: true,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 150,
//                       child: RadioListTile(
//                         value: 'Other',
//                         groupValue: selected_radio,
//                         title: Text(
//                           "Other",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         onChanged: (val) {
//                           setState(() {
//                             selected_radio = val as String;
//                           });
//                         },
//                         activeColor: Colors.red,
//                         selected: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: TextFormField(
//                   onChanged: (value) {
//                     datetime.text = value;
//                   },
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: "Required*"),
//                     DateValidator('yyyy-MM-dd', errorText: "Enter Valid Date")
//                   ]),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: datetime,
//                   decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                           onPressed: () {
//                             showCupertinoModalPopup(
//                                 context: context,
//                                 builder: (BuildContext builder) {
//                                   return Container(
//                                       height: 100,
//                                       color: Colors.white,
//                                       child: CupertinoDatePicker(
//                                         mode: CupertinoDatePickerMode.date,
//                                         onDateTimeChanged: (value) {
//                                           SystemSound.play(
//                                               SystemSoundType.click);
//                                           setState(() {
//                                             fornatdate =
//                                                 DateFormat('yyyy-MM-dd')
//                                                     .format(value);
//                                             datetime.text = fornatdate;
//                                           });
//                                         },
//                                         initialDateTime: DateTime.now(),
//                                         minimumYear: 1980,
//                                         maximumYear: 2080,
//                                       ));
//                                 });
//                           },
//                           icon: Icon(Icons.calendar_today_outlined)),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.purpleAccent)),
//                       hintText: "Date of Birth",
//                       errorStyle: TextStyle(color: Color(0xffff0000))),
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Container(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                         width: 300,
//                         child: CheckboxListTile(
//                           side: BorderSide(color: Colors.white),
//                           activeColor: Color(0xffff7300),
//                           title: Text(
//                             "${lang_name[0]}",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               lang[0] = !lang[0];
//                               checkboxcon = "${(lang[0]) ? lang_name[0] : ""}" +
//                                   "${(lang[1]) ? lang_name[1] : ""}" +
//                                   "${(lang[2]) ? lang_name[2] : ""}" +
//                                   "${(lang[3]) ? lang_name[3] : ""}";
//                             });
//                           },
//                           value: lang[0],
//                         )),
//                     SizedBox(
//                         width: 300,
//                         child: CheckboxListTile(
//                           side: BorderSide(color: Colors.white),
//                           activeColor: Color(0xffff7300),
//                           title: Text("${lang_name[1]}",
//                               style: TextStyle(color: Colors.white)),
//                           onChanged: (value) {
//                             setState(() {
//                               lang[1] = !lang[1];
//                               checkboxcon = "${(lang[0]) ? lang_name[0] : ""}" +
//                                   "${(lang[1]) ? lang_name[1] : ""}" +
//                                   "${(lang[2]) ? lang_name[2] : ""}" +
//                                   "${(lang[3]) ? lang_name[3] : ""}";
//                             });
//                           },
//                           value: lang[1],
//                         )),
//                     SizedBox(
//                         width: 300,
//                         child: CheckboxListTile(
//                           side: BorderSide(color: Colors.white),
//                           activeColor: Color(0xffff7300),
//                           title: Text("${lang_name[2]}",
//                               style: TextStyle(color: Colors.white)),
//                           onChanged: (value) {
//                             setState(() {
//                               lang[2] = !lang[2];
//                               checkboxcon = "${(lang[0]) ? lang_name[0] : ""}" +
//                                   "${(lang[1]) ? lang_name[1] : ""}" +
//                                   "${(lang[2]) ? lang_name[2] : ""}" +
//                                   "${(lang[3]) ? lang_name[3] : ""}";
//                             });
//                           },
//                           value: lang[2],
//                         )),
//                     SizedBox(
//                         width: 300,
//                         child: CheckboxListTile(
//                           side: BorderSide(color: Colors.white),
//                           activeColor: Color(0xffff7300),
//                           title: Text("${lang_name[3]}",
//                               style: TextStyle(color: Colors.white)),
//                           onChanged: (value) {
//                             setState(() {
//                               lang[3] = !lang[3];
//                               checkboxcon = "${(lang[0]) ? lang_name[0] : ""}" +
//                                   "${(lang[1]) ? lang_name[1] : ""}" +
//                                   "${(lang[2]) ? lang_name[2] : ""}" +
//                                   "${(lang[3]) ? lang_name[3] : ""}";
//                             });
//                           },
//                           value: lang[3],
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 100,
//               child: Center(
//                 child: InkWell(
//                   onTap: () async {
//                     String name = namecon.text as String;
//                     String email = emailcon.text as String;
//                     String password = passcon.text as String;
//                     String contact = contactcon.text as String;
//                     String dob = datetime.text as String;
//                     String gender = selected_radio as String;
//                     String language = checkboxcon;
//                     String qry =
//                         "insert into userdata (name,email,password,contact,gender,birthdate,language)values('$name','$email','$password','$contact','$gender','$dob','$selected_radio')";
//                     int id = await db!.rawInsert(qry);
//                     print(id);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 50,
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }