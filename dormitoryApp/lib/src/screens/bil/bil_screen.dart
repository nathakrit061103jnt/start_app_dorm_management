import 'dart:async';
import 'dart:convert';

import 'package:dormitory_app/models/index.dart';
import 'package:dormitory_app/src/constants/api.dart';
import 'package:dormitory_app/src/screens/bil/widgets/bil_detail.dart';
import 'package:dormitory_app/src/screens/bil/widgets/payment.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/LocalStorageApp.dart';
import 'package:flutter/services.dart';

final renter = LocalStorageApp.storageApp.getItem('loginRenter');

Future<List<Invoice>> fetchInvoices(http.Client client) async {
  final leasesId = renter["leases_id"];
  final urlApi = '${API.INVOICES_LES}?leases_id=$leasesId';
  final response = await client.get(Uri.parse(urlApi));
  return compute(parseInvoice, response.body);
}

List<Invoice> parseInvoice(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Invoice>((json) => Invoice.fromJson(json)).toList();
}

class BilScreen extends StatelessWidget {
  const BilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'บิลค่าเช่า';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(title: appTitle),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('บิลค่าเช่า'),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: FutureBuilder<List<Invoice>>(
            future: fetchInvoices(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                return InvoicesList(invoices: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class InvoicesList extends StatelessWidget {
  const InvoicesList({Key? key, required this.invoices}) : super(key: key);

  final List<Invoice> invoices;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return Container(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                _routeBilDetail(context, invoice);
              },
              child: ListTile(
                leading: Icon(
                  Icons.document_scanner,
                  size: 60,
                ),
                title: Row(
                  children: [
                    Text(
                      'เลขที่บิลค่าเช่า ',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${invoices[index].invoiceId.toString()}',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ค่าเช่า ${invoices[index].netTotal.toString()} บาท',
                    ),
                    Row(
                      children: [
                        Text(
                          'สาถานะการชำระ',
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        _TextStatus(invoices[index].invoiceStatus),
                      ],
                    )
                  ],
                ),
                isThreeLine: true,
                trailing: _IconStatus(invoices[index].invoiceStatus),
              ),
            ),
          ),
        );
      },
    );
  }

  _routeBilDetail(context, invoice) {
    if (invoice.payId == 0 || invoice.payId == "0") {
      debugPrint('ไปหน้าจ่าเงิน');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Payment(invoice),
        ),
      );
    } else {
      debugPrint('ไปหน้าจ่ายเเล้ว');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BilDetail(invoice),
        ),
      );
    }
  }

  Widget _IconStatus(invoiceStatus) {
    // print(payId.runtimeType);
    // print(payId);
    if ( invoiceStatus == 0 ||  invoiceStatus == "0") {
      return Icon(Icons.help, color: Colors.red);
    }
    else if( invoiceStatus == 1 ||  invoiceStatus == "1") {
      return Icon(Icons.help, color: Colors.amber);
    }
    else {
      return Icon(Icons.done, color: Colors.green);
    }
  }

  Widget _TextStatus(invoiceStatus) {
    // print(payId.runtimeType);
    // print(payId);
    if ( invoiceStatus == 0 ||  invoiceStatus == "0") {
      return Text(
        'ยังไม่ชำระ',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      );
    }
    else if( invoiceStatus == 1 ||  invoiceStatus == "1") {
      return Text(
        'รอการยืนยัน',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 16,
        ),
      );
    }
    else {
      return Text(
        'ชำระเเล้ว',
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
        ),
      );
    }
  }
}
