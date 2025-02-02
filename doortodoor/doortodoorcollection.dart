import 'package:flutter/material.dart';

class DoorToDoorCollectionPage extends StatefulWidget {
  const DoorToDoorCollectionPage({super.key});

  @override
  _DoorToDoorCollectionPageState createState() => _DoorToDoorCollectionPageState();
}

class _DoorToDoorCollectionPageState extends State<DoorToDoorCollectionPage> {
  final List<String> _selectedWasteTypes = [];
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final Map<String, double> wasteCosts = {
    'Paper Waste': 10.0,
    'E-waste': 20.0,
    'Metal Waste': 15.0,
    'Clothes': 5.0,
    'Plastic Waste': 8.0,
    'Other': 25.0,
  };

  double get totalAmount {
    return _selectedWasteTypes.fold(0, (total, wasteType) => total + (wasteCosts[wasteType] ?? 0.0));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text('Door-to-Door Collection', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Waste Types:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...wasteCosts.keys.map((wasteType) {
              return CheckboxListTile(
                title: Text(wasteType),
                value: _selectedWasteTypes.contains(wasteType),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedWasteTypes.add(wasteType);
                    } else {
                      _selectedWasteTypes.remove(wasteType);
                    }
                  });
                },
              );
            }).toList(),

            const SizedBox(height: 20),
            const Text('Select Collection Date and Time:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text("Date: ${_selectedDate.toLocal()}".split(' ')[0]),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            Row(
              children: [
                Text("Time: ${_selectedTime.format(context)}"),
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedWasteTypes.isEmpty
                  ? null
                  : () {
                      Navigator.pushNamed(context, '/confirm_payment', arguments: {
                        'totalAmount': totalAmount,
                        'wasteTypes': _selectedWasteTypes,
                        'date': _selectedDate,
                        'time': _selectedTime,
                      });
                    },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
