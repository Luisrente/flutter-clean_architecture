import 'package:clean_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewbuilderScreen extends StatefulWidget {
  const ListviewbuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewbuilderScreen> createState() => _ListviewbuilderScreenState();
}

class _ListviewbuilderScreenState extends State<ListviewbuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //un controlador para escuchar los cambios
  final ScrollController scrollController = ScrollController();
  //en los statefullWidget tenemos dos pasos del siglo de vida importantes
  //initState cuando se creo por primera y una vez
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add5();
        fetchData();
      }
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    //Ahora podemos paa el proceso por 3 segundos
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        //para remover la parte superior
        removeTop: true,
        //para remover la parte inferior
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                //un controlador para escuchar los cambios
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                      // el width de la imagen va a tomar todo el ancho posible
                      width: double.infinity,
                      height: 300,
                      //para que tome todo el espacio que tiene la imagen
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesIds[index]}'));
                },
              ),
            ),
            if (isLoading)
              Positioned(
                  bottom: 40,
                  left: size.width * 0.5 - 30,
                  child: const _LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        width: 60,
        //Para que el container tenga los bordes redondeados
        //El decoration y el color no pueden ir juntos
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
        child: const CircularProgressIndicator(color: AppTheme.primary));
  }
}
