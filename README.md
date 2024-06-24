# PROJETO DE EXTENSÃO DE BANCO DE DADOS - LUAN PANNO

### Prof. Fábio Contarini Carneiro - Universidade Estácio de Sá

O objetivo deste projeto é criar um banco de dados para registro de buracos em vias públicas. Neste projeto, utilizaremos o PostgreSQL como banco de dados e criaremos duas tabelas para atingir tal objetivo: a tabela `denunciante` (para registro de pessoas que denunciaram), e uma tabela `buraco` (para o registro de buracos em via pública).

Para executar o projeto, siga os seguintes passos:

1.  Conecte-se ao banco de dados
2.  Crie um banco de dados para o projeto (neste exemplo, chamaremos de `bd_extensao`)

        CREATE DATABASE bd_extensao;

3.  Agora, acesse ao banco de dados criado usando sua ferramenta de preferência (por exemplo, pgAdmin)
4.  Copie o conteúdo do arquivo `base.sql`, cole na sua ferramenta de preferência e execute a query. Em alternativa, também é possível rodar o arquivo diretamente do terminal utilizando o comando:

        psql bd_extensao < base.sql

5.  Para adicionar denunciantes, com o seu editor de texto de preferência abra o arquivo `inserir_denunciante.sql` e edite as informações presentes para inserção. Neste exemplo, chamaremos o denunciante de "João"

```
INSERT INTO
  denunciante(nome, email, telefone)
VALUES
  (
    'João',
    'joao@mail.com',
    '123456789'
  );
```

6.  Em seguida, salve o arquivo e rode a query anterior no banco de dados

        psql bd_extensao < inserir_denunciante.sql

7.  Antes de inserir um buraco, é necessário copiarmos o ID do denunciante. Podemos utilizar as seguintes queries para tal fim:

```
-- Para selecionar todos os denunciantes
SELECT * FROM denunciante;

-- Para selecionar o ID de um denunciante pelo seu nome
SELECT id FROM usuario WHERE nome = 'João';
```

7.  Com o ID do denunciante em mãos, podemos prosseguir para adicionar um buraco. Com o seu editor de texto de preferência abra o arquivo `inserir_buraco.sql` e edite as informações presentes para inserção

```
INSERT INTO
  buraco(
    denunciante_id,
    endereco,
    referencia,
    cidade,
    estado,
    cep,
    data_ocorrencia,
    gravidade,
    tratado,
    observacao
  )
VALUES
  (
    1,
    'Avenida Nossa Senhora de Copacabana',
    'Em frente ao restaurante italiano',
    'Rio de Janeiro',
    'Rio de Janeiro',
    '123456789',
    '2024-01-31',
    'Alta',
    false,
    'Buraco pequeno mas que atrapalha o trânsito na faixa da direita'
  );
```

8.  E finalmente, salve o arquivo e rode a query anterior no banco de dados

        psql bd_extensao < inserir_buraco.sql

9.  Para verificar todos os buracos registrados, rode a seguinte query:

        SELECT * FROM buraco;

10. Para verificar todos os buracos tratados, rode a seguinte query:

        SELECT * FROM buraco WHERE tratado = true;

11. Para verificar todos os buracos não tratados, rode a seguinte query:

        SELECT * FROM buraco WHERE tratado = false;

12. Para marcar um buraco como tratado, altere o ID presente no arquivo `tratar_buraco.sql` e execute a query

        UPDATE buraco SET tratado = true WHERE id = 1;
