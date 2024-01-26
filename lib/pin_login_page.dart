import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pin_login extends StatefulWidget {
  const pin_login({super.key});

  @override
  _login_page createState() => _login_page();
}

class _login_page extends State<pin_login> {
  Widget login_logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(Icons.security, size: 50),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'PIN LOGIN',
              style: GoogleFonts.roboto(fontSize: 18.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget password_display() {
    return Text(
      password.padRight(6, '_'),
      style: GoogleFonts.roboto(
        fontSize: 19.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget build_numpad_button(String number, String text_number) {
    return InkWell(
      onTap: () => add_pin_number(number),
      child: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
            border: Border.all(
          width: 1.0,
          color: Colors.black,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            Text(
              text_number,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_delete_button() {
    return InkWell(
      onTap: () => delete_pin_number(),
      child: Container(
        width: 65.0,
        height: 65.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.backspace_outlined,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget build_clear_button() {
    return InkWell(
      onTap: () => clear_pin_number(),
      child: Container(
        width: 65.0,
        height: 65.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.clear,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget numpad() {
    double space_size = 10.0;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            build_numpad_button(num[1], num_text[1]),
            SizedBox(width: space_size),
            build_numpad_button(num[2], num_text[2]),
            SizedBox(width: space_size),
            build_numpad_button(num[3], num_text[3]),
          ],
        ),
        SizedBox(height: space_size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            build_numpad_button(num[4], num_text[4]),
            SizedBox(width: space_size),
            build_numpad_button(num[5], num_text[5]),
            SizedBox(width: space_size),
            build_numpad_button(num[6], num_text[6]),
          ],
        ),
        SizedBox(height: space_size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            build_numpad_button(num[7], num_text[7]),
            SizedBox(width: space_size),
            build_numpad_button(num[8], num_text[8]),
            SizedBox(width: space_size),
            build_numpad_button(num[9], num_text[9]),
          ],
        ),
        SizedBox(height: space_size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            build_clear_button(),
            SizedBox(width: space_size),
            build_numpad_button(num[0], num_text[0]),
            SizedBox(width: space_size),
            build_delete_button(),
          ],
        ),
        SizedBox(height: space_size),
      ],
    );
  }

  String password = '';
  var num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var num_text = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];

  void add_pin_number(String new_num) {
    setState(() {
      if (password.length < 6) {
        password += new_num;
      }
    });
  }

  void delete_pin_number() {
    setState(() {
      if (password.isNotEmpty)
        password = password.substring(0, password.length - 1);
    });
  }

  void clear_pin_number() {
    setState(() {
      password = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            login_logo(),
            password_display(),
            numpad(),
          ],
        ),
      ),
    );
  }
}
