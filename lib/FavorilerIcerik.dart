import 'package:flutter/material.dart';

class FavorilerIcerik extends StatelessWidget {
  const FavorilerIcerik({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _imageWithRoundedCorners('images/minibus_image.jpg', 450, 180),
          const SizedBox(height: 20),
         // const SizedBox(height: 20),
         /* _kampanyaKutusu(
            context,
            title: 'BOLU ABANT İZZET BAYSAL ÜNİVERSİTESİ HASTANESİNDE İNDİRİM FIRSATI !',
            date: 'Kampanya 15.06.2024 tarihinde sona eriyor.',
            details: 'İndirimler 3 tipte olacaktır. \n\n A grubu: İZZETBAYSAL Vakfı ve Bolu Abant İzzet Baysal Üniversitesi personeli ile 1.derece yakınları \n B Grubu: İZZETBAYSAL Vakfına bağlı okullarda eğitim gören öğrenci ve mezunlar \n C grubu: B grubunda bulunan öğrencilerin 1.derece yakınları \n\n İndirimler ayakta tedavi ve yatarak tedavi olarak iki tiptedir. İndirim oranları yukarıdaki gruplara göre ve yararlanılan hizmete göre değişmektedir.',
          ),*/
          const SizedBox(height: 20),
          _kampanyaKutusu(
            context,
            title: 'OTOBÜS KARTI KAMPANYASI !',
            date: 'Kampanya 06.10.2024 tarihinde sona eriyor.',
            details: 'İndirimler 3 tipte olacaktır. \n\n Emekliler grubuna ÜCRETSİZ. \n Öğrencilere ÜCRETSİZ. \n BAIBU akademisyenlerine ÜCRETSİZ. \n\n İndirimler yalnızca alttaki butona tıklayan BOLUKART sahiplerince geçerlidir!',
          ),
          const SizedBox(height: 20),
          _imageWithRoundedCorners('images/starbucks_image.webp', 450, 180),
          const SizedBox(height: 20),

          _kampanyaKutusu(
            context,
            title: 'STARBUCKS KAMPANYASI ! ',
            date: 'Kampanya 12.12.2024 tarihinde sona eriyor.',
            details: '2 KAHVE ALANA 1\'i BOLUKART İLE ÜCRETSİZ ! \n\n Detaylar şu şekildedir: Tüm BOLUKART sahipleri kampanyadan faydalanabilir.',
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
  Widget _kampanyaKutusu(BuildContext context, {
    required String title,
    required String date,
    required String details,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 15),
          ),
          Text(
            details,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Butona basıldığında geri bildirim göster
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Kampanyaya Katıldınız!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              'FIRSATI YAKALAYIN',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade900),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _imageWithRoundedCorners(String imagePath, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
