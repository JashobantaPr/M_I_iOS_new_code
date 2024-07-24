import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class DocumentViewScreen extends StatelessWidget {
  final String? imageUrl;

  const DocumentViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    print('dfjj ${Url.imageUrl}$imageUrl');
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.3),
      body: Center(
          child: Container(
        width: double.maxFinite,
        decoration:
            BoxDecoration(color: appTheme.white, shape: BoxShape.rectangle),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                '${Url.imageUrl}$imageUrl',
                errorBuilder: (context, error, stackTrace) {
                  return _buildSvgPlaceholder();
                },
              )
            : _buildSvgPlaceholder(),
      )),
    );
  }

  Widget _buildSvgPlaceholder() {
    return SvgPicture.asset(
      'assetes/images/Gallery-02.svg',
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    );
  }
}
