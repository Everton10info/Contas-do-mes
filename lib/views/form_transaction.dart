import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view-models/view_model_form.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({Key? key}) : super(key: key);
  static String pageName = 'FormTransaction';

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    var viewModelForm = Provider.of<ViewModeFormTransaction>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: heigth * 0.52,
            child: Card(
              elevation: 20,
              margin: EdgeInsetsDirectional.only(
                top: heigth * 0.05,
                start: width * 0.05,
                end: width * 0.05, /*  bottom: heigth * 0.02 */
              ),
              shadowColor: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: viewModelForm.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 248, 248),
                            ),
                          ),
                          labelText: 'Transação',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        controller: viewModelForm.value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 248, 248),
                            ),
                          ),
                          labelText: 'Valor',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.5,
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            title: const Text('Entrada'),
                            value: 'input',
                            groupValue: viewModelForm.type,
                            onChanged: (String? value) {
                              setState(() {
                                viewModelForm.type = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: const Text('Saída'),
                            value: 'output',
                            groupValue: viewModelForm.type,
                            onChanged: (String? value) {
                              setState(() {
                                viewModelForm.type = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? temp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2025),
                          );
                          viewModelForm.dueDateTime = temp.toString();
                        },
                        icon: const Icon(Icons.date_range)),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        viewModelForm.edition
                            ? viewModelForm.editionTransactions()
                            : viewModelForm.setTransactions();
                        viewModelForm.dueDateTime = '';
                        viewModelForm.name.text = '';
                        viewModelForm.value.text = '';
                        viewModelForm.dueDateTime = '';

                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ),
          ),

          /*  Container(
            width: 400,
            height: 200,
            child: Lottie.asset('assets/images/animation.json'),
          ) */
        ],
      ),
    );
  }
}
