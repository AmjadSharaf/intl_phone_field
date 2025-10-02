import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';

class MainScreenPhoneField extends StatefulWidget {
  const MainScreenPhoneField({super.key});

  @override
  State<MainScreenPhoneField> createState() => _MainScreenPhoneFieldState();
}

class _MainScreenPhoneFieldState extends State<MainScreenPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        shrinkWrap: true,

        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                height: 25,
                width: 40,
                child: Image.asset(
                  'assets/flags/${countries[index].code.toLowerCase()}.png',
                  package: 'intl_phone_field',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Text('+ ${countries[index].dialCode} '),
              SizedBox(width: 15),
              Expanded(child: Text(countries[index].name)),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: countries.length,
      ),
    );
  }
}
