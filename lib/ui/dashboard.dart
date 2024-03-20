import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Store'),
      ),
      body: Center(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Expanded(
            child: IntrinsicHeight(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://fastly.picsum.photos/id/134/367/267.jpg?hmac=uRNm8LqnnmANfFCodiXXf28J2daYxRyHLfjiKlUauik')),
                  ),
                ),
                const ListProducts(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: viewportConstraints.maxWidth,
                    child: const Image(
                        image: NetworkImage('https://fastly.picsum.photos/id/164/367/267.jpg?hmac=lo2akCuwEgbuUDVu9ee3kNgmyce3Q5_AdsPr_VTxD7s')),
                  ),
                ),
              ]),
            ),
          ),
        );
      })),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ProductImage(),
          ProductImage(
            rndSeed: 2,
            nama: "Foto 1",
            harga: 50000,
          ),
          ProductImage(
            rndSeed: 3,
          )
        ]),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage(
      {super.key,
      this.rndSeed = 1,
      this.nama = "Product Name",
      this.harga = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Image(
              image:
                  NetworkImage('https://fastly.picsum.photos/id/88/367/267.jpg?hmac=QkZ7ZhS6fAqKkIPmnsG9Q2RJ9SDjyg3d78ocMrJwvkU')),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(nama), Text("Rp. $harga")])
        ],
      ),
    );
  }
}