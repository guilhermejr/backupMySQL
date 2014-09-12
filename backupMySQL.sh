#!/bin/bash
#
# Desenvolvido por: Guilherme Jr. http://www.guilhermejr.net
# Licença de uso: GPL
#

# --- Diretório do backup, usuário e senha do MySQL ---
DIRETORIO="/home/guilhermejr/backupMySQL/"
USUARIO="root"
SENHA="senha"

# --- Verifica se o diretório existe --
if [ ! -d "$DIRETORIO" ]; then
	echo "Não foi possível acessar o diretório $DIRETORIO"
	echo "Verifique se o caminho está correto."
	exit 1
fi

# --- Dia da semana ---
DIASEMANA=$(date +"%u")

# --- Pasta onde vai guardar o backup do dia ---
case "$DIASEMANA" in
    "1") PASTA="01-Segunda";;
    "2") PASTA="02-Terca";;
    "3") PASTA="03-Quarta";;
    "4") PASTA="04-Quinta";;
    "5") PASTA="05-Sexta";;
    "6") PASTA="06-Sabado";;
    "7") PASTA="07-Domingo";;
esac

# --- Caminho completo do diretório onde será feito o backup ---
DIRETORIO="$DIRETORIO/$PASTA"

# --- Se o subdiretório não existe cria ---
if [ ! -d "$DIRETORIO" ]; then
	mkdir "$DIRETORIO"
fi

# --- Pega todas as bases de dados ---
bancos=`mysql -u$USUARIO -p$SENHA -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

# --- Cria o backup compactado de todas as bases de dados ---
for banco in $bancos; do
    mysqldump --events -u$USUARIO -p$SENHA $banco | gzip -9 > "$DIRETORIO/$banco.sql.gz"
done