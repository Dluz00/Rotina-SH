#!/bin/bash


origem="/caminho/do/diretorio/origem"
destino="/caminho/do/diretorio/destino"


if [ ! -d "$origem" ]; then
    echo "Erro: Diretório de origem '$origem' não encontrado."
    exit 1
fi


if [ ! -d "$destino" ]; then
    echo "Criando diretório de destino '$destino'..."
    mkdir -p "$destino"
    if [ $? -ne 0 ]; then
        echo "Erro ao criar diretório de destino."
        exit 1
    fi
fi


datahora=$(date +"%Y%m%d_%H%M%S")
arquivo_backup="backup_$datahora.tar.gz"


echo "Criando backup de '$origem' em '$destino/$arquivo_backup'..."
tar -czf "$destino/$arquivo_backup" "$origem"

if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso em '$destino/$arquivo_backup'."
else
    echo "Erro ao criar o backup."
fi


exit 0