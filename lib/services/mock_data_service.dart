import '../models/post_model.dart';

class MockDataService {
  static List<PostModel> getHomePosts() {
    return const [
      PostModel(
        id: '1',
        title: 'Phở bò Hà Nội truyền thống',
        description:
            'Bát phở thơm nồng, nước dùng trong, thịt bò mềm, hành lá tươi',
        imagePath: 'assets/images/pho_bo_HN.webp',
        likes: 124,
        comments: 18,
        shares: 5,
      ),
      PostModel(
        id: '2',
        title: 'Biển Phú Quốc - Thiên đường cát trắng',
        description: 'Hoàng hôn buông xuống trên bãi sao, nước xanh trong, thư giãn cuối tuần',
        imagePath: 'assets/images/bien_phu_quoc.webp',
        likes: 298,
        comments: 42,
        shares: 12,
      ),
      PostModel(
        id: '3',
        title: 'Cà phê muối Đà Nẵng Chill chill',
        description: 'Ly cà phê muối béo ngậy, không gian quán xinh, góc làm việc yên tĩnh',
        imagePath: 'assets/images/cf_muoi.webp',
        likes: 86,
        comments: 9,
        shares: 3,
      ),
    ];
  }

  static List<String> getExploreImages() {
    return List.generate(
      15,
      (index) => 'assets/images/kham_pha_${index + 1}.webp',
    );
  }

  static List<String> getProfileImages() {
    return List.generate(
      9,
      (index) => 'assets/images/ca_nhan_${index + 1}.webp',
    );
  }
}
