import 'package:bones_app/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadCertificat extends StatefulWidget {
  const UploadCertificat({super.key});

  @override
  State<UploadCertificat> createState() => _UploadCertificatState();
}

class _UploadCertificatState extends State<UploadCertificat> {
  String? selectedFileName;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Certification",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.upload_file, color: kSecondaryColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      selectedFileName ?? "Upload your certification",
                      style: TextStyle(
                          color: selectedFileName == null
                              ? Colors.grey
                              : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (selectedFileName != null) ...[
            SizedBox(height: 8),
            Text("Selected: $selectedFileName",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ]
        ],
      ),
    );
  }
}
