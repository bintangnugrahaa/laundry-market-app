import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_session.dart';
import '../../config/nav.dart';
import '../../models/user_model.dart';
import '../auth/login_page.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  void _logout(BuildContext context) {
    DInfo.dialogConfirmation(
      context,
      'Logout',
      'You sure want to logout?',
      textNo: 'Cancel',
    ).then((yes) {
      if (yes ?? false) {
        AppSession.removeUser();
        AppSession.removeBearerToken();
        Nav.replace(context, const LoginPage());
      }
    });
  }

  void _showDialog(BuildContext context, String title, Widget content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showSupportDialog(BuildContext context) {
    _showDialog(
      context,
      'Customer Support',
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(Icons.phone, '+62 851-5534-4998'),
          const SizedBox(height: 10),
          _buildInfoRow(
            Icons.location_on,
            'Jl. Tulip No. 16B, Rawa Panjang, Bojong Gede, Bogor, Jawa Barat',
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationIcon: const Icon(
        Icons.local_laundry_service,
        size: 50,
        color: AppColors.primary,
      ),
      applicationName: 'Di Laundry',
      applicationVersion: 'v1.0.0',
      children: [
        const Text(
          'Laundry Market App to monitor your laundry status',
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: AppSession.getUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return DView.loadingCircle();
        UserModel user = snapshot.data!;

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            _buildUserInfo(user),
            _buildSectionHeader('Settings'),
            _buildListTile(Icons.support_agent, 'Support',
                () => _showSupportDialog(context)),
            _buildListTile(
                Icons.info, 'About', () => _showAboutDialog(context)),
            _buildLogoutButton(context),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
      child: Text(
        'Account',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.green,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildUserInfo(UserModel user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(),
          DView.spaceWidth(),
          _buildUserDetails(user),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return SizedBox(
      width: 70,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(AppAssets.profile, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildUserDetails(UserModel user) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfoText('Username', user.username),
          _buildUserInfoText('Email', user.email),
        ],
      ),
    );
  }

  Widget _buildUserInfoText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        DView.spaceHeight(4),
        Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
        DView.spaceHeight(12),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      onTap: onTap,
      dense: true,
      horizontalTitleGap: 10,
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.navigate_next),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
            height: 2,
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red[500], side: BorderSide.none),
        onPressed: () => _logout(context),
        child: const Text('Logout', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
