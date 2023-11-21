import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // Exchange rate from EUR to RON (moentan hardcodat pentru simplitate)
  double exchangeRate = 4.96;
  double euros = 0;
  double ron = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Column( //folosim coloana pentru a putea centra textul
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Currency Converter',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Spatiu in jurul elementelor
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.network(
              'https://cdn4.iconfinder.com/data/icons/money-13/24/Convert-Bitcoin-1024.png', // Imagine URL
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20), // Spatiu intre elemente
            // Input field
            TextField(
              keyboardType: TextInputType.number, //tastatura numerica
              onChanged: (value) {
                setState(() {  // Pentru a actualiza valoarea variabilei euros (facem refresh la widget)
                  euros = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration( // Textul placeholder
                labelText: 'Enter the amount in Euro',
              ),
            ),
            SizedBox(height: 20),
            // Convert button
            ElevatedButton(  //buton misto :))
              onPressed: () {
                setState(() {
                  // Perform the conversion
                  ron = euros * exchangeRate;
                });
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            // resultat text
            Text('RON: $ron'),
          ],
        ),
      ),
    );
  }
}
