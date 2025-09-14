import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/components/buttons/main_button.dart';
import 'package:taskati/core/services/local_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: LocalHelper.getData(LocalHelper.kName) ?? '',
    );
    final img = LocalHelper.getData(LocalHelper.kImage);
    _imagePath = img is String && img.isNotEmpty ? img : null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (picked != null) {
      setState(() {
        _imagePath = picked.path;
      });
      LocalHelper.cacheData(LocalHelper.kImage, picked.path);
    }
  }

  void _saveProfile() {
    final name = _nameController.text.trim();
    LocalHelper.cacheData(LocalHelper.kName, name);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Changes saved')));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var isDark = LocalHelper.getData(LocalHelper.kIsDark) ?? false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              LocalHelper.cacheData(LocalHelper.kIsDark, !isDark);
              setState(() {});
            },
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _imagePath != null
                        ? FileImage(File(_imagePath!))
                        : const AssetImage('assets/images/user.png')
                              as ImageProvider,
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MainButton(
                    text: 'Save changes',
                    onPressed: _saveProfile,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
