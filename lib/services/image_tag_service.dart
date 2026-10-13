class ImageTagService {
  static const List<String> _doAn = ['đồ ăn', 'thức ăn', 'món ăn', 'ẩm thực'];
  static const List<String> _phongCanh = ['phong cảnh', 'cảnh đẹp'];
  static const List<String> _thienNhien = ['thiên nhiên'];

  static const Map<String, List<String>> _tags = {
    'assets/images/kham_pha_1.webp': [..._doAn, 'phở bò'],
    'assets/images/kham_pha_2.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'biển',
      'vịnh hạ long',
      'thuyền',
      'núi đá',
    ],
    'assets/images/kham_pha_3.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'đỉnh núi',
      'fansipan',
      'sa pa',
      'mây',
    ],
    'assets/images/kham_pha_4.webp': [
      'cà phê muối',
      'cafe',
      'đồ uống',
      'thức uống',
    ],
    'assets/images/kham_pha_5.webp': [
      'đường phố',
      'phố cổ',
      'hà nội',
      'thành phố',
    ],
    'assets/images/kham_pha_6.webp': [..._thienNhien, 'hoa sen'],
    'assets/images/kham_pha_7.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'ruộng bậc thang',
      'lúa',
      'núi',
    ],
    'assets/images/kham_pha_8.webp': [..._doAn, 'bánh mì'],
    'assets/images/kham_pha_9.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'bãi biển',
      'bãi cát',
      'cây dừa',
    ],
    'assets/images/kham_pha_10.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'biển',
      'vịnh hạ long',
      'hoàng hôn',
      'thuyền',
      'núi đá',
    ],
    'assets/images/kham_pha_11.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'đồng cỏ',
      'hoa cúc',
      'núi',
      'hồ',
    ],
    'assets/images/kham_pha_12.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'rừng tre',
    ],
    'assets/images/kham_pha_13.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'hồ',
      'cây cầu',
      'vườn',
      'công viên',
    ],
    'assets/images/kham_pha_14.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'núi phú sĩ',
      'nhật bản',
      'hồ',
    ],
    'assets/images/kham_pha_15.webp': [
      ..._phongCanh,
      ..._thienNhien,
      'hồ',
      'mùa thu',
      'lá cây vàng',
    ],
  };

  static const String _accented =
      'àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđ';
  static const String _plain =
      'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd';

  static List<String> search(List<String> images, String query) {
    final String keyword = query.trim().toLowerCase();
    if (keyword.isEmpty) return images;

    for (final bool wholeWord in [true, false]) {
      for (final bool ignoreDiacritics in [false, true]) {
        final String target = ignoreDiacritics
            ? _removeDiacritics(keyword)
            : keyword;
        final List<String> results = images
            .where(
              (path) => _hasMatch(path, target, wholeWord, ignoreDiacritics),
            )
            .toList();
        if (results.isNotEmpty) return results;
      }
    }
    return [];
  }

  static bool _hasMatch(
    String path,
    String keyword,
    bool wholeWord,
    bool ignoreDiacritics,
  ) {
    final List<String> tags = _tags[path] ?? const [];
    final String needle = wholeWord ? ' $keyword ' : ' $keyword';

    return tags.any((tag) {
      final String text = ignoreDiacritics
          ? _removeDiacritics(tag.toLowerCase())
          : tag.toLowerCase();
      return ' $text '.contains(needle);
    });
  }

  static String _removeDiacritics(String input) {
    final StringBuffer buffer = StringBuffer();
    for (final String char in input.split('')) {
      final int index = _accented.indexOf(char);
      buffer.write(index == -1 ? char : _plain[index]);
    }
    return buffer.toString();
  }
}
