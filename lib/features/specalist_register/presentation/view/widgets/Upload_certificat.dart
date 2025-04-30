import 'dart:io';
import 'package:bones_app/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadCertificate extends StatefulWidget {
  final void Function(File) onFilePicked;

  const UploadCertificate({super.key, required this.onFilePicked});

  @override
  State<UploadCertificate> createState() => _UploadCertificateState();
}

class _UploadCertificateState extends State<UploadCertificate> {
  String? selectedFileName;
  bool _isPickingFile = false; // Guard flag

  void _pickFile() async {
    if (_isPickingFile) return; // Prevent multiple triggers

    setState(() {
      _isPickingFile = true;
    });

    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final path = result.files.single.path;
        if (path != null) {
          final file = File(path);
          widget.onFilePicked(file);
          setState(() {
            selectedFileName = result.files.single.name;
          });
        }
      }
    } catch (e) {
      print('File picking failed: $e');
    } finally {
      setState(() {
        _isPickingFile = false;
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
          const Text(
            "Certification",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: _isPickingFile ? Colors.grey.shade100 : null,
              ),
              child: Row(
                children: [
                  Icon(Icons.upload_file, color: kSecondaryColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedFileName ?? "Upload your certification",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selectedFileName == null
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                  ),
                  if (_isPickingFile) ...[
                    const SizedBox(width: 8),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (selectedFileName != null) ...[
            const SizedBox(height: 8),
            Text(
              "Selected: $selectedFileName",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }
}
