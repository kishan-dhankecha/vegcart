import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id, title, description, imgUrl, blurHash;
  final double price, rating;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.blurHash,
    @required this.description,
    @required this.rating,
    @required this.price,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Products extends ChangeNotifier {
  List<Product> get items {
    List<Product> temp = [..._items];
    temp.shuffle();
    return temp;
  }

  List<Product> get favorites =>
      _items.where((prod) => prod.isFavorite).toList();

  Product findById(String prodId) {
    return _items.firstWhere((prod) => prod.id == prodId);
  }

  List<Product> _items = <Product>[
    Product(
      id: "dk-product-2020/001",
      title: "Tomato",
      rating: 4.2,
      price: 28.25,
      imgUrl:
          "https://www.thermofisher.com/blog/wp-content/uploads/2014/08/tomatoes.jpg",
      description:
          "Tomatoes are the major dietary source of the antioxidant lycopene, which has been linked to many health benefits, including reduced risk of heart disease and cancer. They are also a great source of vitamin C, potassium, folate, and vitamin K.",
      blurHash:
          ':wRUdZjYyrRkyDtQo}s:tRo}WVVsniW;jFniy?aeVst7i^WVVsWBspnin%aeSLofX7X8yDX8VsoLRjjGkCfiR*V@a{kWj[n%ofofW;kCWBayoMV[j]j[a|aKj[o}oLaefPjZ',
    ),
    Product(
      id: "dk-product-2020/002",
      title: "Potato",
      rating: 4,
      price: 22.50,
      imgUrl:
          "https://www.mr-fruity.co.uk/wp-content/uploads/2019/04/potato-04.jpg",
      blurHash:
          ':nQJ4JWZ.9s*tSj]xuj?%NtRjrM{WBofaeWB.TkCWAV@V?ogRPafWARPRQtRt7WCj]ozxujrV?bca}jsofj[RjWBt7ozj]aeaxWBogjsWAkCj[aeayaeofflf7jsaxWBj[jt',
      description:
          "Potatoes contain a good amount of carbs and fiber, as well as vitamin C, vitamin B6, potassium and manganese. Their nutrient contents can vary depending on the type of potato and cooking method.",
    ),
    Product(
      id: "dk-product-2020/003",
      title: "Acorn Squash",
      rating: 3,
      price: 266.30,
      imgUrl:
          "https://tbrnewsmedia.com/wp-content/uploads/2020/10/Acorn-Squash-scaled.jpg",
      blurHash:
          ':vOy;JxuyENe.8j?kWt6s;ofWBj?ofbIR*WB.TRjnhoJM{jsRPWCbcbHa}WBayjFoLs.x]bHRit6RjWEt7s:oLaxj[a#WAj@kCbbxZj[WBWCjsj[ogayWVWBkCofaebHofWV',
      description:
          "Acorn squash, also called pepper squash or Des Moines squash, is a winter squash with distinctive longitudinal ridges on its exterior and sweet, yellow-orange flesh inside. Although considered a winter squash, acorn squash belongs to the same species as all summer squashes.",
    ),
    Product(
      id: "dk-product-2020/004",
      title: "Beetroot",
      rating: 5,
      price: 42.00,
      imgUrl:
          "https://post.healthline.com/wp-content/uploads/2020/09/AN172-Beets-732x549-Thumb_0.jpg",
      blurHash:
          ':EG@rqy=.l\$*5kAUD+%L+%ko\$fS}R\$NsM{oyFxELIBIn-9M{xBNGwGJ#tMr{a%oxRRouo{Sxxo=|ohS\$M}S1InNHEL%2-Vt4xuR*WExGIoIpn+X8xt%1-ooLs:R%RiRkELod',
      description:
          "The beetroot is the taproot portion of a beet plant, usually known in Canada and the USA as beets while the vegetable is referred to as beetroot in British English, and also known as the table beet, garden beet, red beet, dinner beet or golden beet.",
    ),
    Product(
      id: "dk-product-2020/005",
      title: "Basil",
      rating: 4,
      price: 348.50,
      imgUrl:
          "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/266425_2200-732x549.jpg",
      blurHash:
          ':hI~P2o\$~WxZt8odWEt7??jvVuWURQjbs;ogxabXRRR\$NFbFobof-Xo#j_jFWTWBWAe=NGxIWAa#WSoebFj@n.oMs:WBWAjbWBa#xIk8oyaxj?RkWBj]ogt5s:ofoMofWDaf',
      description:
          "Basil, also called great basil, is a culinary herb of the family Lamiaceae. Basil is native to tropical regions from central Africa to Southeast Asia. It is a tender plant, and is used in cuisines worldwide.",
    ),
    Product(
      id: "dk-product-2020/006",
      title: "Carrot",
      rating: 4,
      price: 48.60,
      imgUrl:
          "https://www.almanac.com/sites/default/files/styles/primary_image_in_article/public/image_nodes/carrots-table_popidar-ss.jpg?itok=lh-pzqm3",
      blurHash:
          ':9IL}L041z}A5pO9RS%0B3N3OT\$*niOU-B\$z1M]U=aoM#-XQ\$PNbSv#qxDs:sAOBNdI=\$%sV}Y5,9^NbSfi|xDJ8oLADJ8}Y\$\$r]J7NbJAae-9=dS2R-S1\$i\$jsmj[Wp9]Eg',
      description:
          "The carrot is a root vegetable, usually orange in color, though purple, black, red, white, and yellow cultivars exist. They are a domesticated form of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds.",
    ),
    Product(
      id: "dk-product-2020/008",
      title: "Cucumber",
      rating: 4,
      price: 35.20,
      imgUrl:
          "https://snaped.fns.usda.gov/sites/default/files/seasonal-produce/2018-05/cucumbers2.jpg",
      blurHash:
          ':LKL4|00}eSasqs;oZxvEh4ojER\$WFofodoNQ_Ioo@ogIoaxRkRjOURie=xvxtWUjaax?bt5R%ajV?t7RRWB%MbFxaRjNZjbS2ozt7V@IUaejYkV%LWUV]RktQxuRkj]V@WU',
      description:
          "Cucumber is a widely-cultivated creeping vine plant in the Cucurbitaceae gourd family that bears cucumiform fruits, which are used as vegetables. There are three main varieties of cucumber—slicing, pickling, and burpless/seedless—within which several cultivars have been created.",
    ),
    Product(
      id: "dk-product-2020/009",
      title: "Sweet potato",
      rating: 3,
      price: 32.30,
      imgUrl:
          "https://organicfoodshare.com.au/wp-content/uploads/D7DEEEED-9684-4B08-88C0-FF90B258A023-600x600.jpeg",
      blurHash:
          ':pPr:*xt?^M{x]oyjGt8%gbHR%aKafo#V@js.SbIaMRkRPoKRjV@RQozRjWBt7ofofWBozayV?xtWVR*ofaej=V@ogR*ofoJWBofozRjWBoyayogofkCWBt7flozjZRjWBWB',
      description:
          "The sweet potato or sweetpotato is a dicotyledonous plant that belongs to the bindweed or morning glory family, Convolvulaceae. Its large, starchy, sweet-tasting, tuberous roots are a root vegetable. The young shoots and leaves are sometimes eaten as greens.",
    ),
    Product(
      id: "dk-product-2020/010",
      title: "Radish",
      rating: 4,
      price: 63.70,
      imgUrl: "https://s3.amazonaws.com/cdn.gurneys.com/images/800/85087.jpg",
      blurHash:
          ':ELp~X~V00--MzWAs:i_00x@yESJt7R+oLof009s_2XTtQxuW?bb.AE2i]xvM|xtM|S1iw%3W?i^t7RjbHR,-qnlIBWVs:S#s:ofaKe.R:R+Rkoyaet7W:ShWBbcR*jXozRk',
      description:
          "The radish is an edible root vegetable of the family Brassicaceae that was domesticated in Asia prior to Roman times. Radishes are grown and consumed throughout the world, being mostly eaten raw as a crunchy salad vegetable with a pungent flavor.",
    ),
    Product(
      id: "dk-product-2020/011",
      title: "Cabbage",
      rating: 5,
      price: 75.00,
      imgUrl:
          "https://5.imimg.com/data5/TQ/MB/VF/SELLER-3722283/cabbage-500x500.jpg",
      blurHash:
          ':tQJ+8oy?Jf7a\$j?bGayxuayf9juWAj[ayaz?dWBM_j[awa|ayofRij[R%fiogazs;fks=j[R\$ayj]oLj]WBRma}xuazjcayR%jsWTaya#j[oMa#j@j@xaj@R%ayWBj[a{fR',
      description:
          "Cabbage is a leafy green, red, or white biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage, and belongs to the 'cole crops' or brassicas, meaning it is closely related to broccoli and cauliflower; Brussels sprouts; and Savoy cabbage.",
    ),
    Product(
      id: "dk-product-2020/012",
      title: "Onion",
      rating: 4,
      price: 124.60,
      imgUrl: "https://s3.india.com/wp-content/uploads/2020/08/red-onion.jpg",
      blurHash:
          ':rPPfnt8_NaKb]Rjxuozs:ofbbR%V@oLoLbH?^RiM{t8eos;M{WBR%WBs:oMkCbGRjjZ%Mt7M_WBaeayofjZoybFV[oMofbHj[ayjuoMaeRjoybHoLkCt7ayWBayofjaj[kC',
      description:
          "The onion, also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium. Its close relatives include the garlic, scallion, shallot, leek, chive, and Chinese onion.",
    ),
    Product(
      id: "dk-product-2020/013",
      title: "Cauliflower",
      rating: 5,
      price: 46.20,
      imgUrl:
          "https://i1.wp.com/www.eatthis.com/wp-content/uploads//media/images/ext/407850298/whole-cauliflower.jpg?fit=1024%2C750&ssl=1",
      blurHash:
          ':KE.;3M{4V^*R%ELRkxa~pE29ZxuR%j[s;axDjt7tPIooznms;W-My%LxtM{t7ahoeoLIVofxtRQj[xtoLaeM|R%oxa\$s:s:Rkayahj?t6f8aeoLWBWVt7ofoeWCV[oeWVof',
      description:
          "Cauliflower is one of several vegetables in the species Brassica oleracea in the genus Brassica, which is in the Brassicaceae family. It is an annual plant that reproduces by seed. Typically, only the head is eaten – the edible white flesh sometimes called 'curd'.",
    ),
    Product(
      id: "dk-product-2020/014",
      title: "Button Mushroom",
      rating: 2,
      price: 200.00,
      imgUrl:
          "https://snaped.fns.usda.gov/sites/default/files/styles/crop_ratio_7_5/public/seasonal-produce/2018-05/mushrooms.jpg?h=b754914e&itok=Kldbq8Du",
      blurHash:
          ':OI4^aaeIoW=M|ayoLRj~pRjRjkCR*fQWBofIoWVRkayaxj[ogt7WBxubHWBRjRjxuj[t6t7t7fRNGM{ofoeflWBRjofj[oeWBfPozRjRjt7WBj]s:jsxuayRjofofoeaybH',
      description:
          "A mushroom or toadstool is the fleshy, spore-bearing fruiting body of a fungus, typically produced above ground, on soil, or on its food source.",
    ),
    Product(
      id: "dk-product-2020/015",
      title: "Broccoli",
      rating: 4,
      price: 78.20,
      imgUrl:
          "https://solidstarts.com/wp-content/uploads/Broccoli_edited-480x320.jpg",
      blurHash:
          ':eLX#h%g^-oLnVahS0j]9GafRQWTt5V]WBt6xdoMITbHW,bEoMWBIUoykBoMV_t6oeV[%4M{k9bFaxoNjuofM{t6ofogagaya#axxbf6R%f8oLfijbfPa#axt7agWBaxkBWC',
      description:
          "Broccoli is an edible green plant in the cabbage family whose large flowering head, stalk and small associated leaves are eaten as a vegetable. Broccoli is classified in the Italica cultivar group of the species Brassica oleracea.",
    ),
    Product(
      id: "dk-product-2020/016",
      title: "Corn",
      rating: 3,
      price: 52.00,
      imgUrl:
          "https://www.mayoclinichealthsystem.org/-/media/national-files/images/hometown-health/2018/corn.jpg",
      blurHash:
          ':TJ@BA%JE7RmIroLRkRR~RxpaiNIM|a}t6R+E7xV-mkBf6ofoeR+-ntOt5jcR-j[RkV[\$~ayt7Irsl\$~oyxsbIRkRlWC-mt5kBbH%0R*Rl%0j[NdoKRkt5Rks.oyNHWEs:oe',
      description:
          "Corn is a starchy vegetable and cereal grain that has been eaten all over the world for centuries. It's rich in fiber, vitamins and minerals. However, the health benefits of corn are controversial — while it contains beneficial nutrients, it can also spike blood sugar levels.",
    ),
    Product(
      id: "dk-product-2020/017",
      title: "Bitter melon",
      rating: 3,
      price: 54.20,
      imgUrl:
          "https://images.herzindagi.info/image/2019/Feb/tasty-karela-recipe-main.jpg",
      blurHash:
          ':CAw|Q.i?H%enAVcR8nS%wb;xar]RRaMV[RkuuR7IWMMNGR*X4kTMzVbRkaMafbrtPkByUV^SKtitPoytQtQQ@oLbFpEtio{oys:Q;V[bYRkafoeW.V]VuVvo{ayafaMafaf',
      description:
          "Karela, also known as bitter gourd and bitter melon, is a popular ingredient in many Asian countries. In India, it is often made into a dish called khatta meetha karela, where the bitter gourd is cooked with several ingredients, including cumin, chilies, ginger, coriander, and turmeric.",
    ),
    Product(
      id: "dk-product-2020/018",
      title: "Okra",
      rating: 5,
      price: 38.45,
      imgUrl:
          "https://im.indiatimes.in/content/2014/Oct/1739119_1437679123.jpg",
      blurHash:
          ':vP7dp%3-rohxcR%xbR%ogs=NEbDoMj[oNWB^-RjNFofRibEWBj[xbWma\$Rkk9aya{ofn-WVf#j=WVoMfRj]W,Rjxbt8WUoNR%ayWTaxjcWBofa#axoMWBj=ogR*ayoeoeaz',
      description:
          "Okra or Okro, Abelmoschus esculentus, known in many English-speaking countries as ladies' fingers or ochro, is a flowering plant in the mallow family. It is valued for its edible green seed pods. The geographical origin of okra is disputed, with supporters of West African, Ethiopian, and South Asian origins.",
    ),
    Product(
      id: "dk-product-2020/019",
      title: "Aubergine",
      rating: 4,
      price: 28.35,
      imgUrl:
          "https://bloximages.chicago2.vip.townnews.com/thesouthern.com/content/tncms/assets/v3/editorial/e/63/e630fcfd-216a-54f0-9652-2eb1860ada14/5f57d16b9989f.image.jpg?resize=1200%2C1141",
      blurHash:
          ':sO|X?WC?c%2%MWCogWBkCofs:WBRjazjbWB~qoJIUM|M{ofRjof%2M|M{t7t7oeofofogofWAoeRjaxtQWBRjt7ofRjt7WBRjWCRjWUaxj[xbafWBoffiWBt7jtV[j]ayof',
      description:
          "Eggplant, aubergine or brinjal is a plant species in the nightshade family Solanaceae. Solanum melongena is grown worldwide for its edible fruit. Most commonly purple, the spongy, absorbent fruit is used in several cuisines. Typically used as a vegetable in cooking, it is a berry by botanical definition.",
    ),
    Product(
      id: "dk-product-2020/020",
      title: "Garlic",
      rating: 5,
      price: 135.85,
      imgUrl:
          "https://draxe.com/wp-content/uploads/2017/01/RawGarlicBenefitsThumbnail.jpg",
      blurHash:
          ':9Hx7{\$dDjH=004onhOF1P4:t7NGM{%1RjoL009Z_4-=?vkqt6jE00~pR\$IUxuWFX9D%.9bc8_xHs9xaxu-ps+R5RQ%h%MbcV@%g\${^,JUM^R.adD%WETL9^\$%V?D%M_t6Rj',
      description:
          "Garlic is a species in the onion genus, Allium. Its close relatives include the onion, shallot, leek, chive, Welsh onion and Chinese onion. It is native to Central Asia and northeastern Iran and has long been a common seasoning worldwide, with a history of several thousand years of human consumption and use.",
    ),
  ];
}
