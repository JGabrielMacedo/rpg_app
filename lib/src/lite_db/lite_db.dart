import 'package:path/path.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/character.dart';
import 'package:rpg_app/src/models/pericia.dart';
import 'package:rpg_app/src/models/player.dart';
import 'package:sqflite/sqflite.dart';

/// Properties

const DATABASE_NAME = "rpg_character.db";

const PERSONAGEM_TABLE_NAME = "personagem";
const id_personagem = "id";
const nome_personagem = "nome";
const level_personagem = "level";
const fraquezas_personagem = "fraquezas";
const pontosdDeVida_personagem = "pontosDeVida";
const equipamentos_personagem = "equipamentos";
const talentos_personagem = "talentos";
const habilidades_personagem = "habilidades";
const baseAtributosCode_personagem = "atributos_code";
const periciasCode_personagem = "pericias_code";

const ATRIBUTOS_TABLE_NAME = "atributos";
const id_atributo = "id";
const destreza_atributo = "destreza";
const constituicao_atributo = "constituicao";
const inteligencia_atributo = "inteligencia";
const sabedoria_atributo = "sabedoria";
const carisma_atributo = "carisma";
const forca_atributo = "forca";

const PERICIAS_TABLE_NAME = "pericias";
const id_pericia = "id";
const acrobacia_pericia = "acrobacia";
const arcanismo_pericia = "arcanismo";
const atletismo_pericia = "atletismo";
const atuacao_pericia = "atuacao";
const enganacao_pericia = "enganacao";
const furtividade_pericia = "furtividade";
const intimidacao_pericia = "intimidacao";
const intuicao_pericia = "intuicao";
const investigacao_pericia = "investigacao";
const lidarComAnimais_pericia = "lidarComAnimais";
const medicina_pericia = "medicina";
const persuasao_pericia = "persuasao";
const percepcao_pericia = "percepcao";
const instintoDeSobrevivencia_pericia = "instintoDeSobrevivencia";

/// Comandos DB e tabelas
const CRIA_CHARACTER_TABLE = "CREATE TABLE IF NOT EXISTS $PERSONAGEM_TABLE_NAME ("
    "$id_personagem INTEGER PRIMARY KEY, "
    "$nome_personagem TEXT, "
    "$level_personagem INTEGER, "
    "$fraquezas_personagem Text, "
    "$pontosdDeVida_personagem INTEGER, "
    "$equipamentos_personagem TEXT, "
    "$talentos_personagem TEXT, "
    "$habilidades_personagem TEXT, "
    "$baseAtributosCode_personagem INTEGER, "
    "$periciasCode_personagem INTEGER)";

const CRIA_ATRIBUTOS_TABLE = "CREATE TABLE IF NOT EXISTS $ATRIBUTOS_TABLE_NAME ("
    "$id_atributo INTEGER PRIMARY KEY, "
    "$destreza_atributo INTEGER DEFAULT 0, "
    "$constituicao_atributo INTEGER DEFAULT 0, "
    "$inteligencia_atributo INTEGER DEFAULT 0, "
    "$sabedoria_atributo INTEGER DEFAULT 0, "
    "$carisma_atributo INTEGER DEFAULT 0, "
    "$forca_atributo INTEGER DEFAULT 0)";

const CRIA_PERICIAS_TABLE = "CREATE TABLE IF NOT EXISTS $PERICIAS_TABLE_NAME ("
    "$id_pericia INTEGER PRIMARY KEY, "
    "$acrobacia_pericia INTEGER DEFAULT 0, "
    "$arcanismo_pericia INTEGER DEFAULT 0, "
    "$atletismo_pericia INTEGER DEFAULT 0, "
    "$atuacao_pericia INTEGER DEFAULT 0, "
    "$enganacao_pericia INTEGER DEFAULT 0, "
    "$furtividade_pericia INTEGER DEFAULT 0, "
    "$intimidacao_pericia INTEGER DEFAULT 0, "
    "$intuicao_pericia INTEGER DEFAULT 0, "
    "$investigacao_pericia INTEGER DEFAULT 0, "
    "$lidarComAnimais_pericia INTEGER DEFAULT 0, "
    "$medicina_pericia INTEGER DEFAULT 0, "
    "$persuasao_pericia INTEGER DEFAULT 0, "
    "$percepcao_pericia INTEGER DEFAULT 0, "
    "$instintoDeSobrevivencia_pericia INTEGER DEFAULT 0)";

const GET_ITEMS_PERICIAS_TABLE = "SELECT * from $PERICIAS_TABLE_NAME";
const GET_ITEMS_ATRIBUTOS_TABLE = "SELECT * from $ATRIBUTOS_TABLE_NAME";
const GET_ITEMS_PERSONAGEM_TABLE = "SELECT * from $PERSONAGEM_TABLE_NAME";

class ApplicationDataBase {
  const ApplicationDataBase();

  Future<Database> _getDataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (dataBase, version) async {
        await dataBase.execute(CRIA_CHARACTER_TABLE);
        await dataBase.execute(CRIA_ATRIBUTOS_TABLE);
        await dataBase.execute(CRIA_PERICIAS_TABLE);
        await dataBase.insert(PERSONAGEM_TABLE_NAME, const Personagem().toJson());
        await dataBase.insert(PERICIAS_TABLE_NAME, const Pericia().toJson());
        await dataBase.insert(ATRIBUTOS_TABLE_NAME, const Atributos().toJson());
      },
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  Future<void> salvarDefaultConfigDB(Player player) async {
    await salvarAtributos(player.atributos);
    await salvarPericias(player.pericia );
    await salvarPersonagem(player.personagem);
  }

  Future<int?> salvarPersonagem(Personagem personagem) async {
    final Database db = await _getDataBase();
    Map<String, dynamic> personagemJson = personagem.toJson();
    return db.insert(PERSONAGEM_TABLE_NAME, personagemJson);
  }

  Future<int?> salvarAtributos(Atributos atributos) async {
    final Database db = await _getDataBase();
    Map<String, dynamic> atributosJson = atributos.toJson();
    return db.insert(ATRIBUTOS_TABLE_NAME, atributosJson);
  }

  Future<int?> salvarPericias(Pericia atributos) async {
    final Database db = await _getDataBase();
    Map<String, dynamic> atributosJson = atributos.toJson();
    return db.insert(PERICIAS_TABLE_NAME, atributosJson);
  }

  Future<Player> getPlayer() async {
    final Map<String, dynamic> periciasMap = (await _getPericia()).first;
    final Map<String, dynamic> atributosMap = (await _getAtributos()).first;
    final Map<String, dynamic> personagemMap = (await _getCharacter()).first;

    Map<String, dynamic> allJson = {};

    allJson["pericias"] = periciasMap;
    allJson["atributos"] = atributosMap;
    allJson["personagem"] = personagemMap;

    final Player player = Player.fromJson(allJson);

    return player;
  }

  Future<void> updtaeAllTables(Player player) async {
    updateAtributos(player.atributos );
    updatePericia(player.pericia );
    updatePersonagem(player.personagem ) ;
  }

  Future<List<Map<String, dynamic>>> _getCharacter() async {
    final Database db = await _getDataBase();
    final List<Map<String, dynamic>> result = await db.rawQuery(GET_ITEMS_PERSONAGEM_TABLE);
    return result;
  }

  Future<List<Map<String, dynamic>>> _getAtributos() async {
    final Database db = await _getDataBase();
    final List<Map<String, dynamic>> result = await db.rawQuery(GET_ITEMS_ATRIBUTOS_TABLE);
    return result;
  }

  Future<List<Map<String, dynamic>>> _getPericia() async {
    final Database db = await _getDataBase();
    final List<Map<String, dynamic>> result = await db.rawQuery(GET_ITEMS_PERICIAS_TABLE);
    return result;
  }

  Future<int?> updatePersonagem(Personagem personagem) async {
    final Database db = await _getDataBase();
    final int result = await db.update(
      PERSONAGEM_TABLE_NAME,
      personagem.toJson(),
      where: "$id_personagem = ${personagem.id}",
    );
    return result;
  }

  Future<int?> updateAtributos(Atributos atributo) async {
    final Database db = await _getDataBase();
    final int result = await db.update(
      ATRIBUTOS_TABLE_NAME,
      atributo.toJson(),
      where: "$id_personagem = ${atributo.id}",
    );
    return result;
  }

  Future<int?> updatePericia(Pericia pericia) async {
    final Database db = await _getDataBase();
    final int result = await db.update(
      PERICIAS_TABLE_NAME,
      pericia.toJson(),
      where: "$id_personagem = ${pericia.id}",
    );
    return result;
  }
}
