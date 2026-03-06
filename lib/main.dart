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
        fontFamily: 'NotoSansSC',
        scaffoldBackgroundColor: const Color(0xFFE6E7F4),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _searchBar(),
              const SizedBox(height: 18),
              _studyCard(),
              const SizedBox(height: 18),
              _toolsCard(),
              const SizedBox(height: 18),
              _quoteCard(),
              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _searchBar() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFF2D2D3A), width: 2),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 30, color: Color(0xFF1E1E29)),
          SizedBox(width: 12),
          Text(
            '查询英文或中文',
            style: TextStyle(fontSize: 36 / 2, color: Color(0xFF292733)),
          ),
        ],
      ),
    );
  }

  Widget _studyCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4FA),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2E2F42), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF2E2F42),
            offset: Offset(0, 4),
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
                  fontSize: 46 / 2,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181823),
                ),
              ),
              Icon(Icons.settings_outlined, size: 28, color: Color(0xFF606071)),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Row(
              children: [
                Expanded(flex: 20, child: _BarSegment(color: Color(0xFF445EA7))),
                Expanded(flex: 10, child: _BarSegment(color: Color(0xFFD9A9D2))),
                Expanded(flex: 70, child: _BarSegment(color: Color(0xFFE1E1E1))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatBlock(label: '已学习', value: '890', dotColor: Color(0xFF445EA7)),
              _StatBlock(label: '已标熟', value: '403', dotColor: Color(0xFFD9A9D2)),
              _StatBlock(label: '待学习', value: '3746', dotColor: Color(0xFFE1E1E1)),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAF0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('学习计划', style: TextStyle(fontSize: 18, color: Color(0xFF727284))),
                  SizedBox(width: 8),
                  Icon(Icons.edit_note, size: 20, color: Color(0xFF727284)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: '新学',
                  count: '0/10',
                  color: Color(0xFF445EA7),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _ActionButton(
                  label: '复习',
                  count: '10/215',
                  color: Color(0xFFD9A9D2),
                  textColor: Color(0xFF322C3C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toolsCard() {
    final items = [
      ('学习记录', Icons.history, Color(0xFFAFC0FF)),
      ('收藏本', Icons.star_border, Color(0xFFDAB0D9)),
      ('错题本', Icons.error_outline, Color(0xFFF3B2B2)),
      ('主题本', Icons.menu_book_outlined, Color(0xFFD4CCF9)),
      ('自建词书', Icons.bookmark_add_outlined, Color(0xFFD9D1F2)),
      ('巩固练习', Icons.check_circle_outline, Color(0xFFD9C4CF)),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4FA),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2E2F42), width: 2),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 20,
        children: items
            .map(
              (item) => SizedBox(
                width: 84,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: item.$3,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFF2A2A3B), width: 2),
                      ),
                      child: Icon(item.$2, size: 26, color: const Color(0xFF2A2A3B)),
                    ),
                    const SizedBox(height: 8),
                    Text(item.$1, style: const TextStyle(fontSize: 16, color: Color(0xFF222232))),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _quoteCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFFA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '“\nThe best time to plant a tree was 20 years\nago. The second best time is now.\n',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              height: 1.4,
              color: Color(0xFF3D3D4D),
            ),
          ),
          Text(
            '种树的最好时间是二十年前，其次是现在。',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF9A9AAA),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigation() {
    return BottomAppBar(
      color: const Color(0xFFDADBEA),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _BottomItem(label: '单词', icon: Icons.bookmark, active: true),
            _BottomItem(label: '统计', icon: Icons.bar_chart),
            _BottomItem(label: '我的', icon: Icons.person_outline),
          ],
        ),
      ),
    );
  }
}

class _BarSegment extends StatelessWidget {
  const _BarSegment({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(height: 8, color: color);
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({required this.label, required this.value, required this.dotColor});

  final String label;
  final String value;
  final Color dotColor;

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
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF7A7A87))),
          ],
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 30, color: Color(0xFF2A2A36))),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.count,
    required this.color,
    required this.textColor,
  });

  final String label;
  final String count;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(32)),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' $count',
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.85),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({required this.label, required this.icon, this.active = false});

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
          height: 42,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFB8BEDA) : Colors.transparent,
            borderRadius: BorderRadius.circular(21),
          ),
          child: Icon(icon, size: 30, color: const Color(0xFF3A3B4B)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: const Color(0xFF242533),
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
