import 'package:flutter/material.dart';

void main() {
  runApp(const VocabApp());
}

class VocabApp extends StatelessWidget {
  const VocabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDBE2FF),
        fontFamily: 'NotoSansSC',
      ),
      home: const VocabularyHomePage(),
    );
  }
}

class VocabularyHomePage extends StatelessWidget {
  const VocabularyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _TechBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Column(
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 18),
                  _buildMainCard(),
                  const SizedBox(height: 18),
                  _buildToolCard(),
                  const SizedBox(height: 18),
                  _buildQuoteCard(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FF),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFF313345), width: 1.8),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 32, color: Color(0xFF1D1D2A)),
          SizedBox(width: 12),
          Text(
            '查询英文或中文',
            style: TextStyle(fontSize: 18, color: Color(0xFF2D2C38)),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF313345), width: 1.8),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF313345),
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '考研词汇 ›',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1A24),
                ),
              ),
              Icon(Icons.settings_outlined, size: 30, color: Color(0xFF5D5D6E)),
            ],
          ),
          const SizedBox(height: 22),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Row(
              children: const [
                Expanded(flex: 18, child: _ProgressSegment(color: Color(0xFF4660A9))),
                Expanded(flex: 8, child: _ProgressSegment(color: Color(0xFFD7A8D3))),
                Expanded(flex: 74, child: _ProgressSegment(color: Color(0xFFE1E1E4))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatInfo(label: '已学习', value: '890', dot: Color(0xFF4660A9)),
              _StatInfo(label: '已标熟', value: '403', dot: Color(0xFFD7A8D3)),
              _StatInfo(label: '待学习', value: '3746', dot: Color(0xFFE1E1E4)),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDF3),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '学习计划',
                    style: TextStyle(
                      color: Color(0xFF7A7A89),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.edit, size: 16, color: Color(0xFF7A7A89)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          const Row(
            children: [
              Expanded(
                child: _ActionChip(
                  title: '新学',
                  subtitle: '0/10',
                  bgColor: Color(0xFF4660A9),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _ActionChip(
                  title: '复习',
                  subtitle: '10/215',
                  bgColor: Color(0xFFDDB1D8),
                  textColor: Color(0xFF342C39),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard() {
    final tools = <({String label, IconData icon, Color color})>[
      (label: '学习记录', icon: Icons.access_time, color: const Color(0xFFB7C8FF)),
      (label: '收藏本', icon: Icons.star_outline, color: const Color(0xFFDDB4DC)),
      (label: '错题本', icon: Icons.priority_high, color: const Color(0xFFF3B5B4)),
      (label: '主题本', icon: Icons.subject, color: const Color(0xFFD9D2FF)),
      (label: '自建词书', icon: Icons.bookmark_add_outlined, color: const Color(0xFFD9D1F2)),
      (label: '巩固练习', icon: Icons.check_circle_outline, color: const Color(0xFFE1C9D3)),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF313345), width: 1.8),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 16,
        children: tools
            .map(
              (item) => SizedBox(
                width: 85,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: item.color,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF2A2A39), width: 1.8),
                      ),
                      child: Icon(item.icon, color: const Color(0xFF2A2A39), size: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(item.label, style: const TextStyle(fontSize: 14, color: Color(0xFF242432))),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildQuoteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '“\nThe best time to plant a tree was 20 years\nago. The second best time is now.\n',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 22,
              height: 1.35,
              color: Color(0xFF4A4A59),
            ),
          ),
          Text(
            '│ 种树的最好时间是二十年前，其次是现在。',
            style: TextStyle(fontSize: 16, color: Color(0xFFAAAAB7)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: const Color(0xFFE1E5F8),
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavButton(label: '单词', icon: Icons.bookmark, active: true),
            _NavButton(label: '统计', icon: Icons.bar_chart),
            _NavButton(label: '我的', icon: Icons.person_outline),
          ],
        ),
      ),
    );
  }
}

class _TechBackground extends StatelessWidget {
  const _TechBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFDCE5FF),
              Color(0xFFCDD8FC),
              Color(0xFFDEE6FF),
            ],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -90,
              left: -80,
              child: _GlowOrb(
                size: 250,
                color: Color(0x5C9EC2FF),
              ),
            ),
            Positioned(
              right: -70,
              top: 210,
              child: _GlowOrb(
                size: 180,
                color: Color(0x55D1B2FF),
              ),
            ),
            Positioned(
              left: -40,
              bottom: 130,
              child: _GlowOrb(
                size: 150,
                color: Color(0x55B7E8FF),
              ),
            ),
            IgnorePointer(
              child: CustomPaint(
                size: Size.infinite,
                painter: _GridPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            color.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const lineSpacing = 42.0;
    final paint = Paint()
      ..color = const Color(0x33FFFFFF)
      ..strokeWidth = 1;

    for (double x = 0; x < size.width; x += lineSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += lineSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class _ProgressSegment extends StatelessWidget {
  const _ProgressSegment({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(height: 8, color: color);
  }
}

class _StatInfo extends StatelessWidget {
  const _StatInfo({required this.label, required this.value, required this.dot});

  final String label;
  final String value;
  final Color dot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(shape: BoxShape.circle, color: dot),
            ),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B88))),
          ],
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 54 / 2, color: Color(0xFF2D2D39))),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.textColor,
  });

  final String title;
  final String subtitle;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: textColor),
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(fontSize: 24 / 1.2, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: ' $subtitle',
                style: TextStyle(
                  fontSize: 15,
                  color: textColor.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.icon, this.active = false});

  final String label;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFBCC3DF) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 30, color: const Color(0xFF3A3B4C)),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: const Color(0xFF252635),
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
