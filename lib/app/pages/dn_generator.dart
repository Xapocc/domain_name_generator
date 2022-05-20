import 'dart:io';

import 'package:domain_name_generator/misc/Colors.dart';
import 'package:flutter/material.dart';

enum WordPosition {
  start,
  end,
  domainName,
}

class PageDnGenerator extends StatefulWidget {
  const PageDnGenerator({Key? key}) : super(key: key);

  final List<String> startWords = const [
    'One',
    'Two',
    'Three',
    'Four',
    'goo'
  ]; // TODO: get from API
  final List<String> endWords = const [
    'one',
    'two',
    'three',
    'four',
    'gle'
  ]; // TODO: get from API

  @override
  State<StatefulWidget> createState() => PageDnGeneratorState();
}

class PageDnGeneratorState extends State<PageDnGenerator> {
  late String startValue;
  late String endValue;

  @override
  void initState() {
    super.initState();

    startValue = widget.startWords[0];
    endValue = widget.endWords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: _buildWordSection(
            startValue,
            WordPosition.start,
          ),
        ),
        Flexible(
          child: _buildWordSection(
            endValue,
            WordPosition.end,
          ),
        ),
        Flexible(
          child: Align(
            alignment: Alignment.topCenter,
            child: TextButton(
              onPressed: () async {
                String address = "";

                try {
                  address =
                      (await InternetAddress.lookup("$startValue$endValue.com"))
                          .first
                          .address;
                } catch (ex) {
                  address = "Not occupied";
                }

                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(address),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Generate"),
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: MyColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWordSection(String value, WordPosition wordPosition) {
    List<String> dropDownItems = [];

    if (wordPosition == WordPosition.start) dropDownItems = widget.startWords;
    if (wordPosition == WordPosition.end) dropDownItems = widget.endWords;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            wordPosition == WordPosition.start
                ? "Start:"
                : wordPosition == WordPosition.end
                    ? "End:"
                    : "",
            style: const TextStyle(color: MyColors.primary),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: value,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (wordPosition == WordPosition.start) {
                          startValue = newValue!;
                          return;
                        }
                        if (wordPosition == WordPosition.end) {
                          endValue = newValue!;
                          return;
                        }
                      });
                    },
                    items: dropDownItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: _msc(MyColors.primaryOverlay),
                      foregroundColor: _msc(MyColors.primary),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return _buildWordsListDialog(wordPosition);
                        },
                      );
                    },
                    child: const Icon(Icons.list),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordsListDialog(WordPosition position) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: _buildWordsList(position),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWordsList(WordPosition position) {
    List<Widget> output = [];

    if (position != WordPosition.start && position != WordPosition.end) {
      return [];
    }

    for (String item in position == WordPosition.start
        ? widget.startWords
        : widget.endWords) {
      output.add(Text(item));
    }

    return output;
  }

  _msc(Color c) => MaterialStateColor.resolveWith((states) => c);
}
