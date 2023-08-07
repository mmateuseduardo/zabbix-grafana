#!/bin/bash

# Verifica o status do serviço usando o systemctl
# Utilização: ./check_service_status.sh "servicename"

SERVICE_NAME=$1

# Verifica se o nome do serviço foi fornecido como argumento
if [ -z "$SERVICE_NAME" ]; then
    echo "ERROR: O nome do serviço não foi fornecido como argumento."
    exit 2
fi

if systemctl -q is-active "$SERVICE_NAME"; then
    echo "1" # Serviço encontrado (status OK)
else
    echo "2" # Serviço não encontrado (status de erro)
fi

# Verifica se o serviço existe no systemctl
#if ! systemctl -q is-active "$SERVICE_NAME"; then
#    echo "ERROR: Serviço '$SERVICE_NAME' não encontrado."
#    exit 2
#fi

# Comando para obter o status do serviço usando systemctl
SERVICE_STATUS=$(systemctl is-active "$SERVICE_NAME")

# Mapeia o status do serviço para 1 (ok) ou 2 (erro)
if [ "$SERVICE_STATUS" == "active" ] || [ "$SERVICE_STATUS" == "running" ]; then
    STATUS_CODE="1"
else
    STATUS_CODE="2"
fi

# Salva o status do serviço em um arquivo de texto
echo "$STATUS_CODE" > "/etc/zabbix/script/tmp/service_status.txt"

# Comando para obter informações sobre o uso de memória do serviço usando systemctl
MEMORY_USAGE=$(systemctl show "$SERVICE_NAME" --property MemoryCurrent)

# Extrai o uso de memória do serviço
MEMORY=$(echo "$MEMORY_USAGE" | awk -F "=" '{print $2}')

# Salva o uso de memória em um arquivo de texto
echo "$MEMORY" > "/etc/zabbix/script/tmp/service_memory.txt"

# Comando para obter o tempo de atividade do serviço usando systemctl
UPTIME=$(systemctl show "$SERVICE_NAME" --property ActiveEnterTimestamp | awk -F "=" '{print $2}')
CURRENT_TIME=$(date +%s)
UPTIME_SECONDS=$((CURRENT_TIME - $(date -d "$UPTIME" +%s)))

# Formata o tempo de atividade para o formato "dias:horas:minutos:segundos"
UPTIME_FORMATTED=$(printf '%d:%02d:%02d:%02d' $(($UPTIME_SECONDS/86400)) $(($UPTIME_SECONDS/3600%24)) $(($UPTIME_SECONDS/60%60)) $(($UPTIME_SECONDS%60)))

# Salva o tempo de atividade em um arquivo de texto
echo "$UPTIME_FORMATTED" > "/etc/zabbix/script/tmp/service_uptime.txt"