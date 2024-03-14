import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'mbx_home_controller.dart';
import 'mbx_home_grid_cell.dart';

class MbxHomePage extends StatelessWidget {
  MbxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHomeController>(
        init: MbxHomeController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Beranda',
            ),
            bottomPadding: false,
            bodyView: Material(
              child: Scrollbar(
                  child: ListView(padding: EdgeInsets.zero, children: [
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.85,
                  crossAxisCount: 4,
                  padding: EdgeInsets.all(8.0),
                  physics: ClampingScrollPhysics(),
                  /*
                  itemCount: controller.movieListVM.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 0.68,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final movie = controller.movieListVM.list[index];
                    return Material(
                        color: ColorX.transparent,
                        child: InkWell(
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            highlightColor: ColorX.highlight,
                            onTap: () {},
                            child: MbxHomeGridCell(movie)));
                  }, */
                  children: [
                    MbxHomeGridCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.arrowRightArrowLeft,
                        title: 'Transfer'),
                    MbxHomeGridCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.sackDollar,
                        title: 'Tarik Tunai'),
                    MbxHomeGridCell(
                        color: ColorX.teal,
                        faIcon: FontAwesomeIcons.landmark,
                        title: 'Deposito'),
                    MbxHomeGridCell(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.handHoldingDollar,
                        title: 'Paylater'),
                    MbxHomeGridCell(
                        color: ColorX.red,
                        faIcon: FontAwesomeIcons.qrcode,
                        title: 'QRIS'),
                    MbxHomeGridCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.houseFlag,
                        title: 'Bayar'),
                    MbxHomeGridCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.circleDollarToSlot,
                        title: 'Top Up'),
                    MbxHomeGridCell(
                        color: ColorX.gray,
                        faIcon: FontAwesomeIcons.ellipsis,
                        title: 'Lainnya'),
                  ],
                ),
                controller.movieListVM.list.length > 0
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          padEnds: false,
                          autoPlay: true,
                          viewportFraction: 0.75,
                          height: 120.0,
                          onPageChanged: (index, reason) {
                            controller.setPageIndex(index);
                          },
                        ),
                        itemCount: controller.movieListVM.list.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          final movie = controller.movieListVM.list[index];
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: ImageX(
                                        url: movie.poster,
                                        width: double.infinity,
                                        height: double.infinity,
                                        cornerRadius: 12.0,
                                        fit: BoxFit.cover,
                                      )))); //)));
                        })
                    : Container(),
                SizedBox(height: 8.0),
              ])),
            )));
  }
}