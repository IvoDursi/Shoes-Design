import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'src/pages/zapato_page.dart';
 
void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ZapatoModel>(create: (_) => ZapatoModel()),
      ],
      child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ZapatoPage()
    );
  }
}