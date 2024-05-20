import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MultipleDropDownScreen extends StatefulWidget {
  const MultipleDropDownScreen({Key? key}) : super(key: key);

  @override
  State<MultipleDropDownScreen> createState() => _MultipleDropDownScreenState();
}

class _MultipleDropDownScreenState extends State<MultipleDropDownScreen> {
  List<String> selectedFirstItems = [];
  List<String> selectedSecondItems = [];

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final Map<String, List<String>> secondDropDownItems = {
    'Item 1': ['11', '12', '13', '14', '15'],
    'Item 2': ['21', '22', '23', '24', '25'],
    'Item 3': ['31', '32', '33', '34', '35'],
    'Item 4': ['41', '42', '43', '44', '45'],
    'Item 5': ['51', '52', '53', '54', '55'],
  };

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
                      selectedFirstItems =
                          options.map((item) => item.value.toString()).toList();
                    });
                  },
                  options: items
                      .map((item) => ValueItem(label: item, value: item))
                      .toList(),
                  maxItems: 1,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 250,
                  borderColor: Colors.black,
                  borderWidth: 1,
                  singleSelectItemStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
                const SizedBox(height: 20),
                if (selectedFirstItems.isEmpty)
                  const Text(
                    'Please select the item',
                    style: TextStyle(color: Colors.red),
                  )
                else
                  MultiSelectDropDown(
                    onOptionSelected: (options) {
                      setState(() {
                        selectedSecondItems = options
                            .map((item) => item.value.toString())
                            .toList();
                      });
                    },
                    //selectedFirstItems mathi item select kare che and ene lagti items ape che
                    options: selectedFirstItems
                        .expand((item) => secondDropDownItems[item] ?? [])
                        .map((e) => ValueItem(label: e, value: e))
                        .toList(),
                    maxItems: 5,
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
                    print('Selected First Items: $selectedFirstItems');
                    print('Selected Second Items: $selectedSecondItems');
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
