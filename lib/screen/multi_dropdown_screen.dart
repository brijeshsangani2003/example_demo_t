import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class multiDropDownScreen extends StatefulWidget {
  const multiDropDownScreen({super.key});

  @override
  State<multiDropDownScreen> createState() => _multiDropDownScreenState();
}

class _multiDropDownScreenState extends State<multiDropDownScreen> {
  List<String> selectedItems = [];

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                MultiSelectDropDown(
                  onOptionSelected: (options) {
                    setState(() {
                      selectedItems =
                          options.map((item) => item.value.toString()).toList();
                    });
                  },

                  ///label:item 1     value:1
                  options: items
                      .map((item) => ValueItem(label: item, value: item))
                      .toList(),
                  maxItems: 6,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 250,
                  borderColor: Colors.black,
                  borderWidth: 1,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('========>$selectedItems');
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
