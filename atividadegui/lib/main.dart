import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String selectedCity = '';
  String selectedVencimento = '5';

  TextEditingController usuarioController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();

  bool eletrotecnica = false;
  bool automacao = false;
  bool desenvolvimento = false;

  @override
  void dispose() {
    usuarioController.dispose();
    cpfController.dispose();
    dataNascimentoController.dispose();
    enderecoController.dispose();
    numeroController.dispose();
    observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário'),
                subtitle: TextField(
                  controller: usuarioController,
                  decoration: InputDecoration(hintText: 'Informe seu nome de usuário'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('CPF'),
                subtitle: TextField(
                  controller: cpfController,
                  decoration: InputDecoration(hintText: 'Informe seu CPF'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Data de Nascimento'),
                subtitle: TextField(
                  controller: dataNascimentoController,
                  decoration: InputDecoration(hintText: 'Informe sua data de nascimento'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Dia do Vencimento'),
                subtitle: DropdownButtonFormField<String>(
                  value: selectedVencimento,
                  items: ['5', '10', '15'].map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedVencimento = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Áreas de Interesse:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              CheckboxListTile(
                title: Text('Eletrotécnica'),
                value: eletrotecnica,
                onChanged: (value) {
                  setState(() {
                    eletrotecnica = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Automação'),
                value: automacao,
                onChanged: (value) {
                  setState(() {
                    automacao = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Desenvolvimento de Sistemas'),
                value: desenvolvimento,
                onChanged: (value) {
                  setState(() {
                    desenvolvimento = value!;
                  });
                },
              ),
              TextFormField(
                controller: enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: numeroController,
                      decoration: InputDecoration(labelText: 'Número'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Cidade'),
                      value: selectedCity.isEmpty ? null : selectedCity,
                      items: [
                        'Recife',
                        'São Paulo',
                        'João Pessoa',
                        'Jaboatão dos Guararapes',
                      ].map((city) {
                        return DropdownMenuItem(value: city, child: Text(city));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: observacaoController,
                decoration: InputDecoration(labelText: 'Observação'),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para cadastrar os dados
                    print('Usuário: ${usuarioController.text}');
                    print('CPF: ${cpfController.text}');
                    print('Data de Nascimento: ${dataNascimentoController.text}');
                    print('Dia de Vencimento: $selectedVencimento');
                    print('Áreas de Interesse:');
                    if (eletrotecnica) print('- Eletrotécnica');
                    if (automacao) print('- Automação');
                    if (desenvolvimento) print('- Desenvolvimento de Sistemas');
                    print('Endereço: ${enderecoController.text}');
                    print('Número: ${numeroController.text}');
                    print('Cidade: $selectedCity');
                    print('Observação: ${observacaoController.text}');
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
