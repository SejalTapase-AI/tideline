import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const TideLineApp());
}

class TideLineApp extends StatelessWidget {
  const TideLineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TideLine',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// GLOBAL CONSTANTS
// ============================================================

const navy = Color(0xFF0F172A);
const blue = Color(0xFF2563EB);
const lightBlue = Color(0xFFDBEAFE);
const background = Color(0xFFF8FAFC);
const border = Color(0xFFE2E8F0);
const grey = Color(0xFF64748B);
const lightGrey = Color(0xFFF1F5F9);
const green = Color(0xFF16A34A);
const yellow = Color(0xFFF59E0B);
const orange = Color(0xFFF97316);
const red = Color(0xFFDC2626);

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: navy,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.waves,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'TIDELINE',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: navy,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 54),

              // HERO
              const Text(
                'KNOW THE RISK\nBEFORE YOU BUY.',
                style: TextStyle(
                  fontSize: 39,
                  height: 0.98,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                  color: navy,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Climate intelligence for property decisions '
                'in a changing coastline.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.45,
                  color: grey,
                ),
              ),

              const SizedBox(height: 32),

              // PROPERTY RISK CARD
              _FeatureCard(
                icon: Icons.home_work_outlined,
                title: 'PROPERTY RISK',
                subtitle: 'Should I buy this property?',
                description:
                    'Assess flood exposure, climate risk and future '
                    'property vulnerability before investing.',
                buttonText: 'CHECK PROPERTY',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PropertyScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // CITY RISK CARD
              _FeatureCard(
                icon: Icons.map_outlined,
                title: 'MUMBAI RISK MAP',
                subtitle: 'Where is coastal risk increasing?',
                description:
                    'Explore how coastal exposure may evolve across '
                    'Mumbai and identify vulnerable zones.',
                buttonText: 'EXPLORE MUMBAI',
                isDark: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MumbaiRiskMapScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              // IMPORTANT FRAMING
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFBFDBFE),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: blue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'We don’t predict a “drowned Mumbai”. '
                        'We identify where coastal exposure is increasing, '
                        'how risk may evolve, and what decisions can be '
                        'taken today.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: navy.withOpacity(.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: Text(
                  'CLIMATE INTELLIGENCE • DECISION SUPPORT',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w800,
                    color: grey.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FEATURE CARD
// ============================================================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isDark;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? navy : Colors.white;
    final primaryText = isDark ? Colors.white : navy;
    final secondaryText =
        isDark ? Colors.white70 : grey;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark ? navy : border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(.1)
                      : lightBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: isDark ? Colors.white : blue,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                  color: isDark ? Colors.white60 : grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            subtitle,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: primaryText,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: secondaryText,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDark ? Colors.white : navy,
                foregroundColor:
                    isDark ? navy : Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: .8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROPERTY SCREEN
// ============================================================

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  final TextEditingController locationController =
      TextEditingController(
    text: 'Worli / Sea Face, Mumbai',
  );

  String propertyType = 'Apartment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _simpleAppBar('PROPERTY ANALYSIS'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PROPERTY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: blue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tell us where\nyou want to invest.',
              style: TextStyle(
                fontSize: 32,
                height: 1.05,
                fontWeight: FontWeight.w900,
                color: navy,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'PROPERTY LOCATION',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                color: grey,
              ),
            ),

            const SizedBox(height: 9),

            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Enter location',
                prefixIcon: const Icon(Icons.location_on_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: border),
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'PROPERTY TYPE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                color: grey,
              ),
            ),

            const SizedBox(height: 9),

            DropdownButtonFormField<String>(
              initialValue: propertyType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: border),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Apartment',
                  child: Text('Apartment'),
                ),
                DropdownMenuItem(
                  value: 'Villa',
                  child: Text('Villa'),
                ),
                DropdownMenuItem(
                  value: 'Commercial',
                  child: Text('Commercial'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  propertyType = value ?? 'Apartment';
                });
              },
            ),

            const SizedBox(height: 28),

            // MOCK MAP
            Container(
              height: 190,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: border),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFBAE6FD),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'ARABIAN SEA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 135,
                    top: 35,
                    child: _mapRoad(120),
                  ),
                  Positioned(
                    left: 135,
                    top: 95,
                    child: _mapRoad(170),
                  ),
                  Positioned(
                    left: 220,
                    top: 25,
                    child: _mapRoad(5),
                  ),
                  Positioned(
                    left: 265,
                    top: 25,
                    child: _mapRoad(5),
                  ),
                  Positioned(
                    left: 225,
                    top: 75,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 12,
                    right: 15,
                    child: Text(
                      'DEMO MAP',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: grey,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AnalysisScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'ANALYZE RISK',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mapRoad(double width) {
    return Container(
      height: 4,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// ============================================================
// ANALYSIS SCREEN
// ============================================================

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  double progress = 0;

  final List<String> steps = [
    'Locating property',
    'Checking coastal exposure',
    'Analyzing flood vulnerability',
    'Projecting future climate risk',
    'Calculating TideScore',
  ];

  @override
  void initState() {
    super.initState();
    _runAnalysis();
  }

  Future<void> _runAnalysis() async {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(milliseconds: 650));

      if (!mounted) return;

      setState(() {
        progress = i / 5;
      });
    }

    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const RiskAssessmentScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _simpleAppBar('ANALYZING'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),

            Center(
              child: SizedBox(
                height: 125,
                width: 125,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 8,
                      backgroundColor: border,
                      color: blue,
                    ),
                    Text(
                      '${(progress * 100).round()}%',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: navy,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 45),

            const Text(
              'ANALYZING\nCOASTAL RISK',
              style: TextStyle(
                fontSize: 33,
                height: 1,
                fontWeight: FontWeight.w900,
                color: navy,
              ),
            ),

            const SizedBox(height: 25),

            ...List.generate(
              steps.length,
              (index) {
                final completed =
                    progress >= ((index + 1) / 5);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        completed
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: 19,
                        color: completed ? green : grey,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        steps[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: completed ? navy : grey,
                          fontWeight: completed
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// RISK ASSESSMENT
// ============================================================

class RiskAssessmentScreen extends StatelessWidget {
  const RiskAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _simpleAppBar('RISK ASSESSMENT'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Text(
              'TIDESCORE™',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: blue,
              ),
            ),

            const SizedBox(height: 12),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: CircularProgressIndicator(
                    value: .82,
                    strokeWidth: 17,
                    backgroundColor: border,
                    color: red,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      '82',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w900,
                        color: navy,
                      ),
                    ),
                    Text(
                      '/100',
                      style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFEE2E2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'HIGH RISK',
                style: TextStyle(
                  color: red,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'RISK EVOLUTION',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  color: grey,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: _YearRiskCard(
                    year: '2030',
                    risk: 'MODERATE',
                    color: yellow,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _YearRiskCard(
                    year: '2040',
                    risk: 'HIGH',
                    color: orange,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _YearRiskCard(
                    year: '2050',
                    risk: 'SEVERE',
                    color: red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            _riskRow(
              Icons.water_drop_outlined,
              'Flood Exposure',
              'HIGH',
            ),
            _riskRow(
              Icons.cloud_outlined,
              'Climate Exposure',
              'HIGH',
            ),
            _riskRow(
              Icons.trending_down,
              'Property Value Risk',
              'HIGH',
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RiskReportScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'VIEW RISK REPORT',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _riskRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Icon(icon, color: blue),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: navy,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: red,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _YearRiskCard extends StatelessWidget {
  final String year;
  final String risk;
  final Color color;

  const _YearRiskCard({
    required this.year,
    required this.risk,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          Text(
            year,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17,
              color: navy,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 7,
            width: 42,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            risk,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// RISK REPORT
// ============================================================

class RiskReportScreen extends StatelessWidget {
  const RiskReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _simpleAppBar('RISK REPORT'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'WORLI / SEA FACE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: blue,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Investment Risk Report',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w900,
                color: navy,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEE2E2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFECACA),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: red,
                    size: 35,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RECOMMENDATION',
                          style: TextStyle(
                            fontSize: 10,
                            color: red,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'AVOID',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'WHY THIS PROPERTY IS FLAGGED',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: grey,
              ),
            ),

            const SizedBox(height: 12),

            _reportPoint(
              Icons.water,
              'High coastal flood exposure',
            ),
            _reportPoint(
              Icons.trending_up,
              'Increasing long-term climate exposure',
            ),
            _reportPoint(
              Icons.currency_rupee,
              'Potential future property-value pressure',
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: border),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DECISION NOTE',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w900,
                      color: blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The current risk profile suggests that '
                    'long-term coastal exposure should be a '
                    'major factor in the investment decision.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: navy,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: navy,
                  side: const BorderSide(color: border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'CHECK ANOTHER PROPERTY',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: .8,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const MumbaiRiskMapScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'EXPLORE MUMBAI RISK MAP',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: .8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportPoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: blue,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: navy,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// NEW SOLUTION — MUMBAI RISK MAP
// ============================================================

class MumbaiRiskMapScreen extends StatefulWidget {
  const MumbaiRiskMapScreen({super.key});

  @override
  State<MumbaiRiskMapScreen> createState() =>
      _MumbaiRiskMapScreenState();
}

class _MumbaiRiskMapScreenState
    extends State<MumbaiRiskMapScreen> {
  int selectedYear = 2050;

  final Map<int, Map<String, dynamic>> yearData = {
    2030: {
      'risk': 'MODERATE',
      'exposure': 'Growing',
      'zones': '12',
      'infra': '8',
      'color': yellow,
      'message':
          'Early warning stage — several coastal areas show increasing exposure.',
    },
    2040: {
      'risk': 'HIGH',
      'exposure': 'Elevated',
      'zones': '19',
      'infra': '14',
      'color': orange,
      'message':
          'Higher exposure — more residential and infrastructure zones require adaptation.',
    },
    2050: {
      'risk': 'SEVERE',
      'exposure': 'Critical',
      'zones': '27',
      'infra': '21',
      'color': red,
      'message':
          'High-exposure scenario — planning, resilience and adaptation become critical.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = yearData[selectedYear]!;

    return Scaffold(
      appBar: _simpleAppBar('MUMBAI RISK MAP'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            const Text(
              'CITY-LEVEL\nCOASTAL INTELLIGENCE',
              style: TextStyle(
                fontSize: 31,
                height: 1.02,
                fontWeight: FontWeight.w900,
                letterSpacing: -.8,
                color: navy,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'See where Mumbai’s coastal exposure may increase — '
              'instead of reducing the future to a single “drowning” claim.',
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: grey,
              ),
            ),

            const SizedBox(height: 22),

            // YEAR SELECTOR
            const Text(
              'SELECT SCENARIO YEAR',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.4,
                color: grey,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                _yearButton(2030),
                const SizedBox(width: 8),
                _yearButton(2040),
                const SizedBox(width: 8),
                _yearButton(2050),
              ],
            ),

            const SizedBox(height: 18),

            // MAP
            _MumbaiMap(
              selectedYear: selectedYear,
              riskColor: data['color'] as Color,
            ),

            const SizedBox(height: 18),

            // RISK STATUS
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: border),
              ),
              child: Row(
                children: [
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: (data['color'] as Color)
                          .withOpacity(.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: data['color'] as Color,
                      size: 29,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CITY RISK LEVEL',
                          style: TextStyle(
                            fontSize: 9,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w900,
                            color: grey,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          data['risk'] as String,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                            color: data['color'] as Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$selectedYear',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: navy,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // STATS
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    data['zones'] as String,
                    'HIGH-RISK\nZONES',
                    Icons.location_on_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statCard(
                    data['infra'] as String,
                    'CRITICAL\nINFRA',
                    Icons.account_balance_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.trending_up,
                    color: blue,
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Text(
                      'Coastal exposure: ${data['exposure']}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: navy,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // MESSAGE
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.insights_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      data['message'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // WHAT GETS AFFECTED
            const Text(
              'WHAT CAN BE AFFECTED?',
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w900,
                color: grey,
              ),
            ),

            const SizedBox(height: 12),

            _impactItem(
              Icons.home_work_outlined,
              'Residential areas',
              'Homes and residential property',
            ),
            _impactItem(
              Icons.train_outlined,
              'Transport',
              'Roads, rail and connectivity',
            ),
            _impactItem(
              Icons.local_hospital_outlined,
              'Critical infrastructure',
              'Hospitals, utilities and public assets',
            ),
            _impactItem(
              Icons.business_outlined,
              'Economic zones',
              'Commercial and high-value property',
            ),

            const SizedBox(height: 24),

            // ACTION
            const Text(
              'FROM RISK TO ACTION',
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w900,
                color: grey,
              ),
            ),

            const SizedBox(height: 12),

            _actionCard(
              '01',
              'IDENTIFY',
              'Locate vulnerable zones before damage occurs.',
            ),
            _actionCard(
              '02',
              'PRIORITIZE',
              'Focus resilience investments where exposure is highest.',
            ),
            _actionCard(
              '03',
              'ADAPT',
              'Use risk intelligence to guide planning and infrastructure.',
            ),

            const SizedBox(height: 25),

            // DISCLAIMER
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'DEMO NOTE: Risk zones, counts and projections shown '
                'in this prototype are illustrative. A production '
                'version would integrate verified climate, elevation, '
                'flood and infrastructure datasets.',
                style: TextStyle(
                  fontSize: 10.5,
                  height: 1.45,
                  color: grey,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // BACK TO PROPERTY
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PropertyScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: navy,
                  side: const BorderSide(color: border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'ASSESS AN INDIVIDUAL PROPERTY',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                    letterSpacing: .6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _yearButton(int year) {
    final selected = selectedYear == year;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedYear = year;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 45,
          decoration: BoxDecoration(
            color: selected ? navy : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? navy : border,
            ),
          ),
          child: Center(
            child: Text(
              '$year',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: selected ? Colors.white : navy,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: blue,
            size: 22,
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900,
              color: navy,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              height: 1.2,
              letterSpacing: .8,
              fontWeight: FontWeight.w900,
              color: grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _impactItem(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: blue,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard(
    String number,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: blue,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .8,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11.5,
                    height: 1.35,
                    color: grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MUMBAI MAP VISUALIZATION
// ============================================================

class _MumbaiMap extends StatelessWidget {
  final int selectedYear;
  final Color riskColor;

  const _MumbaiMap({
    required this.selectedYear,
    required this.riskColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2FE),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // SEA
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 92,
            child: Container(
              color: const Color(0xFFBAE6FD),
              child: const Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'ARABIAN SEA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // MUMBAI LAND MASS
          Positioned(
            left: 95,
            top: 18,
            right: 15,
            bottom: 15,
            child: ClipPath(
              clipper: MumbaiShapeClipper(),
              child: Container(
                color: const Color(0xFFF8FAFC),
              ),
            ),
          ),

          // RISK ZONES
          Positioned(
            left: 115,
            top: 70,
            child: _zone(
              64,
              riskColor,
            ),
          ),

          Positioned(
            left: 170,
            top: 125,
            child: _zone(
              selectedYear == 2030 ? 42 : 70,
              riskColor,
            ),
          ),

          Positioned(
            left: 235,
            top: 180,
            child: _zone(
              selectedYear == 2050 ? 78 : 45,
              riskColor,
            ),
          ),

          Positioned(
            left: 150,
            top: 215,
            child: _zone(
              selectedYear == 2040 ? 62 : 38,
              riskColor,
            ),
          ),

          // INFRASTRUCTURE MARKERS
          _marker(
            left: 205,
            top: 75,
            icon: Icons.train,
          ),

          _marker(
            left: 275,
            top: 135,
            icon: Icons.local_hospital,
          ),

          _marker(
            left: 195,
            top: 170,
            icon: Icons.account_balance,
          ),

          // LABEL
          const Positioned(
            right: 18,
            top: 15,
            child: Text(
              'MUMBAI',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: navy,
              ),
            ),
          ),

          Positioned(
            right: 15,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$selectedYear SCENARIO',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .8,
                  color: grey,
                ),
              ),
            ),
          ),

          // LEGEND
          Positioned(
            left: 105,
            bottom: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.93),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: riskColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'HIGHER EXPOSURE',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _zone(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(.18),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withOpacity(.5),
          width: 2,
        ),
      ),
    );
  }

  Widget _marker({
    required double left,
    required double top,
    required IconData icon,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: navy,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 13,
        ),
      ),
    );
  }
}

class MumbaiShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * .30, 0);
    path.lineTo(size.width * .72, size.height * .05);
    path.lineTo(size.width * .90, size.height * .18);
    path.lineTo(size.width * .83, size.height * .38);
    path.lineTo(size.width * .96, size.height * .55);
    path.lineTo(size.width * .72, size.height * .65);
    path.lineTo(size.width * .80, size.height * .84);
    path.lineTo(size.width * .54, size.height);
    path.lineTo(size.width * .30, size.height * .88);
    path.lineTo(size.width * .20, size.height * .62);
    path.lineTo(size.width * .05, size.height * .45);
    path.lineTo(size.width * .17, size.height * .22);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// ============================================================
// APP BAR
// ============================================================

AppBar _simpleAppBar(String title) {
  return AppBar(
    backgroundColor: background,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: navy,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w900,
        color: navy,
      ),
    ),
    centerTitle: false,
  );
}