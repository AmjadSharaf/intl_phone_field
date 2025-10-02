import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';

class MainScreenPhoneField extends StatefulWidget {
  const MainScreenPhoneField({super.key});

  @override
  State<MainScreenPhoneField> createState() => _MainScreenPhoneFieldState();
}

class _MainScreenPhoneFieldState extends State<MainScreenPhoneField> {
  late TextEditingController serashText;

  @override
  void initState() {
    super.initState();
    serashText = TextEditingController();
  }

  @override
  void dispose() {
    serashText.dispose();
    super.dispose();
  }

  List<Country> searchContry = [];
  List<Country> get _listToShow {
    return serashText.text.isEmpty ? countries : searchContry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: serashText,
              onChanged: (searchValue) {
                setState(() {
                  searchContry.clear();
                  for (var item in countries) {
                    if (item.name.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    )) {
                      searchContry.add(item);
                    }
                  }
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,

                padding: EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 40,
                            child: Image.asset(
                              'assets/flags/${_listToShow[index].code.toLowerCase()}.png',
                              package: 'intl_phone_field',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text('+ ${_listToShow[index].dialCode} '),
                          SizedBox(width: 15),
                          Expanded(child: Text(_listToShow[index].name)),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: _listToShow.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
