import 'package:flutter/material.dart';
import 'package:member_rkm/app/modules/benefit/components/benefit_item.dart';

class PlatinumBenefit extends StatelessWidget {
  const PlatinumBenefit({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      physics: const ClampingScrollPhysics(),
      children: const [
        BenefitItem(text: 'Gratis biaya pendaftaran'),
        BenefitItem(text: 'Syarat pendaftaran mudah'),
        BenefitItemCustom(
          children: [
            TextSpan(
                text:
                    'Poin dapat ditukar dengan hadiah langsung dengan minimum penukaran sebesar '),
            TextSpan(
              text: '50 poin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        BenefitItemCustom(
          children: [
            TextSpan(
                text:
                    'Member Platinum bisa didapatkan setelah total transaksi customer dengan menggunakan digital member minimum mencapai '),
            TextSpan(
              text: 'Rp 100.000.000,00 ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        BenefitItemCustom(
          children: [
            TextSpan(text: 'Mendapatkan '),
            TextSpan(
              text: '3 poin ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: 'setiap pembelian '),
            TextSpan(
              text: 'Rp 100.000,00 ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text:
                    'untuk semua produk RKM menggunakan Member Platinum RKM'),
          ],
        ),
        BenefitItem(text: 'Poin tidak bisa ditukar dengan uang tunai'),
      ],
    );
  }
}
