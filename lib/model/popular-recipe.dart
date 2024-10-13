abstract class Recipe {
  String get name;
  String get image;
  String? get country;
  List<String> get ingredients;
  List<String> get steps;
  int get cookingTime;
  int? get serving;
}

class PopularRecipe implements Recipe {
  @override
  final String name;
  @override
  final String image;
  @override
  final String country;
  @override
  final List<String> ingredients;
  @override
  final List<String> steps;
  @override
  final int cookingTime;
  @override
  final int serving;

  PopularRecipe({
    required this.name,
    required this.image,
    required this.country,
    required this.ingredients,
    required this.steps,
    required this.cookingTime,
    required this.serving,
  });
}

class AffordableRecipe implements Recipe {
  @override
  final String name;
  @override
  final String image;
  @override
  final List<String> ingredients;
  @override
  final List<String> steps;
  @override
  final int cookingTime;
  @override
  String? get country => null;
  @override
  int? get serving => null;

  AffordableRecipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.steps,
    required this.cookingTime,
  });
}

class KoreanRecipe implements Recipe {
  @override
  final String name;
  @override
  final String image;
  @override
  final List<String> ingredients;
  @override
  final List<String> steps;
  @override
  final int cookingTime;
  @override
  int? serving;
  @override
  String? get country => null;
  

  KoreanRecipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.steps,
    required this.cookingTime,
    required this.serving
  });
}

class RecipeData {
  final List<PopularRecipe> popularRecipes;
  final List<AffordableRecipe> affordRecipes;
  final List<KoreanRecipe> koreanRecipes;

  RecipeData({
    required this.popularRecipes,
    required this.affordRecipes,
    required this.koreanRecipes,
  });
}

final RecipeData dataResep = RecipeData(
  popularRecipes: [
    PopularRecipe(
      name: 'Sushi Rolls',
      image: 'images/salad-fresh-sushi-rolls-chopsticks.jpg',
      country: 'Jepang',
      ingredients: [
        '2 cangkir beras sushi',
        '6 lembar nori',
        '1 timun',
        '1 alpukat',
        '200g ikan salmon segar',
        'Wasabi dan kecap asin untuk pelengkap'
      ],
      steps: [
        'Masak beras sushi sesuai petunjuk',
        'Potong timun, alpukat, dan salmon memanjang',
        'Letakkan nori di atas bamboo mat',
        'Sebarkan beras di atas nori, balik sehingga beras di luar',
        'Tata isian di tengah dan gulung dengan bantuan bamboo mat',
        'Potong roll menjadi 6-8 bagian',
        'Sajikan dengan wasabi dan kecap asin'
      ],
      cookingTime: 45,
      serving: 4,
    ),
    PopularRecipe(
      name: 'Paella',
      image: 'images/top-view-shot-delicious-paella-with-seafood-onion-rings.jpg',
      country: 'Spanyol',
      ingredients: [
        '300g beras pendek',
        '600ml kaldu ayam',
        '1 bawang bombay',
        '2 siung bawang putih',
        '1 paprika merah',
        '200g udang',
        '200g ayam potong dadu',
        '100g chorizo',
        '1/2 sdt safron',
        'Minyak zaitun, garam, dan lada secukupnya'
      ],
      steps: [
        'Tumis bawang bombay dan bawang putih hingga harum',
        'Tambahkan ayam dan chorizo, masak hingga berubah warna',
        'Masukkan beras, paprika, dan safron, aduk rata',
        'Tuang kaldu, masak dengan api kecil selama 15 menit',
        'Tambahkan udang, masak hingga udang matang dan beras mengering',
        'Biarkan paella beberapa menit sebelum disajikan'
      ],
      cookingTime: 40,
      serving: 6,
    ),
    PopularRecipe(
      name: 'Pad Thai',
      image: 'images/pad-thai-white-plate-with-lemon-eggs-seasoning-wooden-table.jpg',
      country: 'Thailand',
      ingredients: [
        '200g mie beras',
        '200g udang kupas',
        '2 butir telur',
        '100g tahu potong dadu',
        '50g tauge',
        '2 sdm kacang tanah cincang',
        'Saus (2 sdm saus ikan, 2 sdm gula palem, 2 sdm air jeruk nipis)',
        'Daun bawang dan jeruk nipis untuk garnish'
      ],
      steps: [
        'Rendam mie beras dalam air hangat hingga lembut',
        'Campur bahan saus dalam mangkuk',
        'Tumis udang dan tahu hingga matang, sisihkan',
        'Orak-arik telur dalam wok',
        'Masukkan mie, saus, udang, dan tahu, aduk rata',
        'Tambahkan tauge, masak sebentar',
        'Sajikan dengan taburan kacang tanah, daun bawang, dan jeruk nipis'
      ],
      cookingTime: 60,
      serving: 3,
    ),
    PopularRecipe(
      name: 'Beef Stroganoff',
      image: 'images/top-view-baked-liver-onion-plate-sea-salt-chopping-board-onions.jpg',
      country: 'Rusia',
      ingredients: [
        '500g daging sapi iris tipis',
        '1 bawang bombay',
        '250g jamur champignon',
        '2 sdm tepung terigu',
        '250ml kaldu sapi',
        '200ml sour cream',
        '1 sdm mustard',
        'Minyak, garam, dan lada hitam secukupnya',
        'Pasta atau nasi untuk penyajian'
      ],
      steps: [
        'Tumis daging sapi hingga kecokelatan, sisihkan',
        'Tumis bawang bombay dan jamur hingga layu',
        'Taburi tepung, aduk rata',
        'Tuang kaldu sapi, masak hingga mengental',
        'Masukkan kembali daging sapi',
        'Tambahkan sour cream dan mustard, aduk rata',
        'Masak dengan api kecil hingga saus mengental',
        'Sajikan di atas pasta atau nasi'
      ],
      cookingTime: 35,
      serving: 4,
    ),
    PopularRecipe(
      name: 'Shakshuka',
      image: 'images/closeup-traditional-shakshuka-frying-pan-wooden-background.jpg',
      country: 'Timur Tengah',
      ingredients: [
        '6 butir telur',
        '400g tomat cincang kalengan',
        '1 bawang bombay',
        '2 siung bawang putih',
        '1 paprika merah',
        '2 sdt paprika bubuk',
        '1 sdt jintan bubuk',
        'Daun peterseli untuk garnish',
        'Roti pita untuk penyajian'
      ],
      steps: [
        'Tumis bawang bombay dan bawang putih hingga harum',
        'Tambahkan paprika, paprika bubuk, dan jintan, tumis sebentar',
        'Masukkan tomat cincang, masak hingga sedikit menyusut',
        'Buat cekungan di sauce, pecahkan telur ke dalamnya',
        'Tutup wajan, masak hingga putih telur matang tapi kuning telur masih setengah matang',
        'Taburi dengan daun peterseli',
        'Sajikan panas dengan roti pita'
      ],
      cookingTime: 25,
      serving: 3,
    )
  ],

  affordRecipes: [
    AffordableRecipe(
      name: 'Nasi Goreng Telur',
      image: 'images/nasi-goreng-telur.jpg',
      cookingTime: 15,
      ingredients: ['Nasi', 'Telur', 'Bawang merah', 'Bawang putih', 'Kecap manis'],
      steps: [
        'Tumis bawang merah dan bawang putih',
        'Masukkan telur dan aduk',
        'Tambahkan nasi dan kecap manis',
        'Aduk rata dan sajikan'
      ],
    ),
    AffordableRecipe(
      name: 'Mie Goreng Sederhana',
      image: 'images/mie-goreng.jpg',
      cookingTime: 20,
      ingredients: ['Mie instan', 'Sayuran (wortel, kol)', 'Telur', 'Bawang merah', 'Bawang putih'],
      steps: [
        'Rebus mie setengah matang',
        'Tumis bawang dan sayuran',
        'Tambahkan telur dan mie',
        'Bumbui dan aduk rata'
      ],
    ),
    AffordableRecipe(
      name: 'Tempe Orek',
      image: 'images/tempe-orek.jpg',
      cookingTime: 25,
      ingredients: ['Tempe', 'Bawang merah', 'Bawang putih', 'Cabai', 'Kecap manis'],
      steps: [
        'Potong tempe kecil-kecil',
        'Goreng tempe hingga kering',
        'Tumis bumbu',
        'Masukkan tempe dan kecap manis, aduk rata'
      ],
    ),
    AffordableRecipe(
      name: 'Sup Sayur Sederhana',
      image: 'images/sup-sayur.jpg',
      cookingTime: 30,
      ingredients: ['Wortel', 'Kentang', 'Kol', 'Bawang putih', 'Daun bawang'],
      steps: [
        'Potong semua sayuran',
        'Rebus air dan masukkan bawang putih',
        'Masukkan sayuran dan masak hingga empuk',
        'Bumbui dan tambahkan daun bawang'
      ],
    ),
    AffordableRecipe(
      name: 'Telur Dadar Padang',
      image: 'images/telur-dadar-padang.jpg',
      cookingTime: 20,
      ingredients: ['Telur', 'Daun bawang', 'Cabai merah', 'Bawang merah', 'Tepung terigu'],
      steps: [
        'Kocok telur dengan semua bahan',
        'Panaskan minyak dalam wajan',
        'Tuang adonan telur',
        'Goreng hingga kecokelatan di kedua sisi'
      ],
    ),
  ],

  koreanRecipes: [
    KoreanRecipe(
      name: 'Bibimbap',
      image: 'images/bibimbap.jpg',
      cookingTime: 30,
      serving: 2,
      ingredients: ['Nasi', 'Sayuran beragam', 'Daging sapi', 'Telur', 'Gochujang'],
      steps: [
        'Siapkan nasi dan sayuran',
        'Tumis daging sapi',
        'Goreng telur',
        'Tata semua bahan di atas nasi',
        'Tambahkan gochujang dan aduk sebelum makan'
      ],
    ),
    KoreanRecipe(
      name: 'Kimchi Jjigae',
      image: 'images/kimchi-jiggae.jpg',
      cookingTime: 40,
      serving: 4,
      ingredients: ['Kimchi', 'Daging babi', 'Tahu', 'Bawang putih', 'Gochugaru'],
      steps: [
        'Tumis kimchi dan daging babi',
        'Tambahkan air dan didihkan',
        'Masukkan tahu dan bumbui',
        'Masak hingga mendidih dan matang'
      ],
    ),
    KoreanRecipe(
      name: 'Japchae',
      image: 'images/japchae.jpg',
      cookingTime: 35,
      serving: 4,
      ingredients: ['Sohun', 'Daging sapi', 'Sayuran beragam', 'Kecap manis', 'Minyak wijen'],
      steps: [
        'Rebus sohun hingga lembut',
        'Tumis daging dan sayuran secara terpisah',
        'Campur semua bahan dan bumbui',
        'Aduk rata dan sajikan'
      ],
    ),
    KoreanRecipe(
      name: 'Samgyeopsal',
      image: 'images/samgyeopsal.jpg',
      cookingTime: 25,
      serving: 3,
      ingredients: ['Daging babi samgyeopsal', 'Selada', 'Bawang putih', 'Gochujang', 'Ssam-jang'],
      steps: [
        'Panggang daging babi',
        'Siapkan daun selada dan saus',
        'Bungkus daging dengan selada dan tambahkan saus',
        'Nikmati langsung'
      ],
    ),
    KoreanRecipe(
      name: 'Tteokbokki',
      image: 'images/tteokbokki.jpg',
      cookingTime: 20,
      serving: 3,
      ingredients: ['Tteok (kue beras)', 'Gochujang', 'Gochugaru', 'Bawang putih', 'Daun bawang'],
      steps: [
        'Rebus tteok hingga lembut',
        'Buat saus dengan gochujang dan gochugaru',
        'Masak tteok dengan saus',
        'Tambahkan daun bawang dan sajikan'
      ],
    ),
  ]
);