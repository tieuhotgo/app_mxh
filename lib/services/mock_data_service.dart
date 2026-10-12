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
        content: ' Phở bò Hà Nội truyền thống là một trong những món ăn làm nên hồn cốt của ẩm thực Thủ đô. Linh hồn của bát phở nằm ở nồi nước dùng được ninh từ xương bò suốt nhiều giờ, cùng gừng và hành nướng thơm lừng, thêm quế, hồi, thảo quả để có vị ngọt thanh, trong vắt mà đậm đà. Bánh phở mềm mịn được trần qua nước sôi, xếp cùng những lát thịt bò tái, chín hay nạm, gầu, rồi rắc hành lá và hành tây thái mỏng. Khác với phở miền Nam, phở Hà Nội thường ăn đơn giản, không kèm nhiều rau sống, chỉ thêm chút chanh, ớt tươi hoặc tỏi ngâm giấm để dậy vị. Một bát phở nóng hổi vào buổi sáng se lạnh chính là cách nhiều người Hà Nội bắt đầu một ngày mới.',
      ),
      PostModel(
        id: '2',
        title: 'Biển Phú Quốc - Thiên đường cát trắng',
        description: 'Hoàng hôn buông xuống trên bãi sao, nước xanh trong, thư giãn cuối tuần',
        imagePath: 'assets/images/bien_phu_quoc.webp',
        likes: 298,
        comments: 42,
        shares: 12,
        content: ' Phú Quốc được mệnh danh là đảo ngọc của Việt Nam, và những bãi biển cát trắng mịn chính là điều níu chân du khách nhất. Ở Bãi Sao, nước biển trong xanh như ngọc, sóng nhẹ, cát mịn trải dài dưới những hàng dừa nghiêng bóng. Buổi sáng, bạn có thể bơi lội, chèo SUP hay lặn ngắm san hô ở vùng nước nông; đến chiều, bầu trời chuyển dần từ vàng cam sang tím hồng, cả bãi biển như được phủ một lớp ánh sáng dịu dàng. Cuối tuần chỉ cần một chiếc khăn trải trên cát, vài trái dừa tươi mát lạnh và tiếng sóng rì rào là đủ để quên đi mọi bộn bề. Thời điểm đẹp nhất để đi là mùa khô, từ khoảng tháng 11 đến tháng 4, nhưng nhớ mang kem chống nắng vì nắng đảo khá gắt.',
      ),
      PostModel(
        id: '3',
        title: 'Cà phê muối Đà Nẵng Chill chill',
        description: 'Ly cà phê muối béo ngậy, không gian quán xinh, góc làm việc yên tĩnh',
        imagePath: 'assets/images/cf_muoi.webp',
        likes: 86,
        comments: 9,
        shares: 3,
        content: ' Cà phê muối là thức uống có nguồn gốc từ Huế, rồi nhanh chóng lan ra khắp các thành phố, trong đó có Đà Nẵng. Điểm đặc biệt nằm ở lớp kem sữa béo ngậy được đánh bông, thêm một chút muối biển, phủ lên ly cà phê đậm đà. Vị mặn nhẹ không lấn át mà làm dịu vị đắng, kéo vị ngọt béo lên rõ hơn, khiến mỗi ngụm vừa lạ vừa dễ nghiện. Nhiều quán ở Đà Nẵng đầu tư không gian rất xinh, ánh sáng ấm, bàn ghế gỗ, lại có góc yên tĩnh hợp để ngồi làm việc hay hẹn bạn bè. Mẹo nhỏ: đừng khuấy ngay, hãy nhấp một ngụm kem mặn béo trước rồi mới đến lớp cà phê bên dưới.',
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
