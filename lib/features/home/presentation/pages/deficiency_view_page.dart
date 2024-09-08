import 'package:flutter/material.dart';
import 'package:nutri_kit/features/home/presentation/pages/body/deficiency_details.dart';

class DeficiencyViewPage extends StatefulWidget {
  const DeficiencyViewPage({
    super.key,
    required this.healthStatus,
  });

  final String healthStatus;

  @override
  State<DeficiencyViewPage> createState() => _DeficiencyViewPageState();
}

class _DeficiencyViewPageState extends State<DeficiencyViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.healthStatus.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          DeficiencyDetails(
            healthStatus: widget.healthStatus.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
