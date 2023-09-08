import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PlantScanPage extends StatefulWidget {
  PlantScanPage({super.key});

  @override
  State<PlantScanPage> createState() => _PlantScanPageState();
}

class _PlantScanPageState extends State<PlantScanPage> {
  final apiKey = "2b106tqQLP6f0OGh8UUtkeBe"; // Set your API_KEY here
  final project = "all"; // Try "weurope" or "canada"
  File? pickedImage;

  Future<void> getPlantData() async {
    final apiEndpoint = Uri.parse(
        "https://my-api.plantnet.org/v2/identify/$project?api-key=$apiKey");

    if (pickedImage != null) {
      final bytes = await pickedImage!.readAsBytes();
      final response = await uploadImage(apiEndpoint, bytes);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(await response.stream.bytesToString());
        print('Status Code: ${response.statusCode}');
        print('Result: ${jsonResponse['results'][2]['species']}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } else {
      print('No image selected.');
    }
  }

  Future<http.StreamedResponse> uploadImage(
      Uri apiEndpoint, List<int> imageBytes) async {
    final request = http.MultipartRequest('POST', apiEndpoint);
    request.files.add(http.MultipartFile.fromBytes(
      'images',
      imageBytes,
      filename: 'image.jpg',
    ));

    return await request.send();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: ScanAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pickedImage != null
                ? Image.file(
                    pickedImage!,
                    height: 150,
                  )
                : Text('No image selected.'),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Capture Image'),
            ),
            ElevatedButton(
              onPressed: getPlantData,
              child: Text('Upload and Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScanAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kbackgroundColor,
      elevation: 3,
      centerTitle: true,
      title: Text(
        'SMART AGRI',
        style: TextStyle(color: Colors.white),
      ),
      //toolbarHeight: 80,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
