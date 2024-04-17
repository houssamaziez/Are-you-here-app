List<ModleStart> listStart = [
  ModleStart(
      title: "مدارس الأندلس الأهلية",
      details: "مرحبا بك",
      image: "assets/images/Learning-cuate.png"),
  ModleStart(
      title: "مزايا التطبيق ",
      details:
          """يُعد تطبيقنا لإدارة المدرسة أداة فعّالة تُمكّن أولياء الأمور من متابعة حضور وانصراف أبنائهم في المدرسة بكل سهولة ويُسر. فور دخول الطالب إلى المدرسة، يتلقى ولي الأمر إشعاراً يُفيد بأن ابنه/ابنته قد وصل إلى المدرسة بأمان. وعند انتهاء اليوم الدراسي، يُرسل التطبيق إشعاراً آخر يُعلم ولي الأمر بخروج الطالب من المدرسة. هذه الميزة توفر راحة البال للأهالي وتعزز الاتصال الفعّال بين المدرسة والأسرة.""",
      image: "assets/images/Monitor-bro.png"),
  ModleStart(
      title: "في الاخير",
      details:
          "اعتبارًا من هذه اللحظة، يسعدنا أعلامكم أنكم أصبحتم أحد أفراد عائلتنا الكريمة.",
      image: "assets/images/Webinar-bro.png"),
];

class ModleStart {
  final String title, details, image;

  ModleStart({required this.title, required this.details, required this.image});
}
