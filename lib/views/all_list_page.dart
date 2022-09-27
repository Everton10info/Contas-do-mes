import 'package:provider/provider.dart';
import '../componets/header.dart';
import '../componets/transaction_card.dart';
import '../view-models/view_model_transaction.dart';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:contas_do_mes/views/form_transaction_page.dart';

class AllListsPage extends StatelessWidget {
  const AllListsPage({Key? key}) : super(key: key);
  static String pageName = '/AllListsPage';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton( splashColor: Colors.black , backgroundColor: Colors.amber,child: Icon(Icons.add), focusElevation:30.6 ,onPressed: (){
        
        Navigator.of(context).push(
          PageTransition(
            curve: Curves.decelerate,
            duration: const Duration(seconds: 2),
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            child: const FormTransactionPage(),
          ),
        );
      }),
      body: Stack(
        children: [
          // White background
          TweenAnimationBuilder<double>(
            duration: duration,
            tween: Tween(begin: 2, end: 0),
            builder: (context, double value, _) {
              return Hero(
                tag: 'all-container',
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(value * 20),
                  ),
                ),
              );
            },
          ),
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.maybePop(context),
                child: const Hero(tag: 'bar', child: Header(isDark: true)),
              ),
              const Hero(
                tag: 'header',
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Lista Geral',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TweenAnimationBuilder<double>(
                  duration: duration,
                  tween: Tween(begin: 0, end: 3),
                  builder: (context, double value, _) {
                    if (value < 1.0) {
                      return const SizedBox.shrink();
                    }
                    return TweenAnimationBuilder<double>(
                      duration: duration,
                      tween: Tween(begin: size.height, end: 0),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, _) {
                        return Transform.translate(
                          offset: Offset(0, value),
                          child: Stack(
                            children: [
                              const _DriversList(),
                              Hero(
                                tag: 'lash',
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _DriversList extends StatefulWidget {
  const _DriversList({
    Key? key,
  }) : super(key: key);

  @override
  State<_DriversList> createState() => _DriversListState();
}

class _DriversListState extends State<_DriversList> {
  bool isScrolling = false;

  _onStartScroll() {
    setState(() {
      isScrolling = true;
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        isScrolling = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onStartScroll();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModelTransaction = Provider.of<ViewModelTransaction>(context);
    viewModelTransaction.fetchAll();
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          _onStartScroll();
        }
        return true;
      },
      child: ListView(
        padding: const EdgeInsets.all(16).copyWith(top: 32),
        children: List.generate(
          viewModelTransaction.allList.length,
          (index) => Column(
            children: [
              TransactionCard(
                index: index,
              ),
              AnimatedSize(
                duration: duration,
                curve: Curves.linear,
                child: SizedBox(
                  height: isScrolling ? 40 : 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
