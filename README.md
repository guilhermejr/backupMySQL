Recentemente precisei criar um Shell Script para realizar o backup de todas as bases de dados de um banco MySQL. Como eu só iria precisar do backup de no máximo uma semana atrás organizei o Script para dentro do diretório do backup criar subdiretórios da seguinte forma::
	
	01-Segunda
	02-Terca
	03-Quarta
	04-Quinta
	05-Sexta
	06-Sabado
	07-Domingo

Dessa forma, depois de uma semana de backup, o mais antigo será sobreposto pelo atual e assim por diante. Só é necessário alterar 3 linhas: a 8, 9 e 10 com o diretório onde será guardado o backup, o usuário e senha do MySQL::

	DIRETORIO="/home/guilhermejr/backupMySQL/"
	USUARIO="root"
	SENHA="senha"

Depois é só mudar a permissão do arquivo e executa-lo::

	$ chmod 755 backupMySQL.sh
	$ ./backupMySQL.sh

Dúvidas e Sugestões favor mandar um e-mail falecom@guilhermejr.net