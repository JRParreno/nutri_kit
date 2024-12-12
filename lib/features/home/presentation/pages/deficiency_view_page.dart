import 'package:flutter/material.dart';
import 'package:nutri_kit/core/enum/health_status_enum.dart';
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
          HealthStatusEnum.waisted.name == widget.healthStatus
              ? 'WASTED'
              : widget.healthStatus.toLowerCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
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
