import 'package:flutter/material.dart';
import 'package:rpg_app/lib/models/expertise.dart';
import 'package:rpg_app/lib/models/expertises_types_enum.dart';
import 'package:rpg_app/lib/models/status_type_enum.dart';
import 'package:rpg_app/lib/static_crud.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = SampleCrud.character.nome;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ficha do seu personagem"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCharacterNameView(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildLinhaLife(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildAtributoView(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildExpertiseView(),
          ),
        ],
      ),
    );
  }

  Widget buildLinhaExpertise(
    ExpertisesType type,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type.toString().substring("ExpertisesType.".length)),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.decreaseExpertise(type)),
          child: const Icon(Icons.remove),
        ),
        Text("${SampleCrud.character.pericias?.statusInfluence[expertises[type]!]}"),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.increaseExpertise(type)),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget buildExpertiseView() {
    return Column(
      children: [
        const Text("Perícias:", textAlign: TextAlign.start),
        ...List.generate(
          expertises.length,
          (index) => buildLinhaExpertise(ExpertisesType.values[index]),
        ),
      ],
    );
  }

  Widget buildLinhaAtributo(
    StatusType type,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type.toString().substring("Statustype.".toString().length)),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.decreaseAttribute(statusType: type)),
          child: const Icon(Icons.remove),
        ),
        Text("${SampleCrud.character.atributos?.getAtribbuteBy(type)}"),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.increaseAttribute(statusType: type)),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget buildAtributoView() {
    return Column(
      children: [
        const Text("Atributos:", textAlign: TextAlign.start),
        ...List.generate(
          StatusType.values.length,
          (index) => buildLinhaAtributo(StatusType.values[index]),
        ),
      ],
    );
  }

  Widget buildLinhaLife() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Vida do personagem"),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.decreaseLife()),
          child: const Icon(Icons.remove),
        ),
        Text("${SampleCrud.character.pontosDeVida}"),
        TextButton(
          style: const ButtonStyle(),
          onPressed: () => setState(() => SampleCrud.increaseLife()),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget buildCharacterNameView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 2,
          child: Text("Nome"),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            onChanged: (content) => setState(() => SampleCrud.changeCharacterName(content)),
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
