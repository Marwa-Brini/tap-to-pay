import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/widgets/drawer/drawer.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> image = [
      "https://lh5.googleusercontent.com/proxy/P5xEQaPh4vliuWD3HbyDbezzuA1iOLztNGblRLmcOnBw-Nj2_bRL1qlDF-actPOo3Etrv_PedxiP3KOLjnPhqyHi4S04__dhjBjG2TyLWvXrlkU",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/SONEDE.svg/1200px-SONEDE.svg.png",
      "https://lh3.googleusercontent.com/proxy/_K8BPrPh0pKHNIaY62JBhQ1OCFEZ-RxaouMPm2MhQD9kwBE3QyER4-Ej1tUbLmZXlWJiXq_Yp82K6lpgB9G4SusRPG-09JFUywaVWMVa",
      "https://www.newrest.eu/wp-content/uploads/2016/01/Star-assurance.png",
      "https://ween.tn/uploads/image/19012/19010/avatar/avatar.png",
      "https://www.gnet.tn/wp-content/uploads/2018/11/logo-gnet-1.png",
    ];
    return Scaffold(
      backgroundColor: AppColors.background,

      drawer: const MainDrawer(),
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4,
            snap: true,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu, color: AppColors.black),
            ),
            title: Text("Payment", style: AppTextStyle.appBarTextStyle),
            centerTitle: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.9,
              ),
              itemCount: image.length,
              itemBuilder:
                  (_, index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightgrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.network(image[index], fit: BoxFit.contain),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
