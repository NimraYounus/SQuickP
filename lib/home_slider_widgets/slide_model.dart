class Slide {
  late final String imageUrl;
  late final String title;
  late final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  //image1
  Slide(
      imageUrl:
          'https://tse2.mm.bing.net/th?id=OIP.GpOQw8HVUZFhfc436aGyhwHaED&pid=Api&P=0',
      title: 'BALUCHISTAN',
      description:
          'Baluchistan is one of the four provinces of Pakistan. It is the largest province in terms of land area, forming the southwestern region of the country, but is the least populated. Its provincial capital and largest city is Quetta.'),
  //image2
  Slide(
    imageUrl:
        'https://tse2.mm.bing.net/th?id=OIP.i3F9hsawrC-HM1wU61AhuAHaHl&pid=Api&P=0',
    title: 'PUNJAB',
    description:
        'Punjab, is one of the four provinces of Pakistan. Punjab is the second-largest province of Pakistan by land area and the most populous',
  ),
  //image3
  Slide(
    imageUrl:
        'https://img.clipartlook.com/isolate-emergency-medical-emergency-medical-services-isolate-clipartby-emergency-clip-art-450_417.jpg',
    title: 'SINDH',
    description:
        'Sindh is one of the four provinces of Pakistan. Located in the southeastern region of the country, Sindh is the third-largest province of Pakistan by total area and the second-largest province by population after Punjab. ',
  ),
  //image4
  Slide(
    imageUrl:
        'https://tse2.mm.bing.net/th?id=OIP.LAJTF_4wd3POJd57G0LtgAHaGu&pid=Api&P=0',
    title: 'KPK',
    description:
        'Khyber Pakhtunkhwa, commonly abbreviated as KP or KPK, is one of the four provinces of Pakistan. Peshawar is a large historic city, the capital of the Pakistani Khyber Pakhtunkhwa province, and situated in the broad Valley of Peshawar in northern Pakistan.',
  ),
];
