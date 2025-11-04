#!/bin/bash
# Script de execução do Sistema RAG - Polícia Federal (CLI Mode)
# Executar com: ./run.sh

echo "🚀 Sistema RAG - Polícia Federal"
echo "📋 Modo: Interface de Linha de Comando (CLI)"
echo "=================================================="

# Verifica se as dependências estão instaladas
if ! python -c "import langchain" 2>/dev/null; then
    echo "⚠️  Dependências não encontradas. Instalando..."
    pip install -r requirements.txt
fi

# Verifica se a pasta SGP existe
if [ ! -d "SGP" ]; then
    echo "📁 Criando pasta SGP/ para documentos..."
    mkdir -p SGP
    echo "⚠️  Adicione arquivos PDF na pasta SGP/ antes de usar o sistema"
fi

# Verifica se Ollama está rodando
if ! curl -s http://localhost:11434/api/tags >/dev/null 2>&1; then
    echo "⚠️  Ollama não está rodando!"
    echo "💡 Execute em outro terminal: ollama serve"
    echo "💡 Ou instale: https://ollama.ai/"
    read -p "Pressione Enter para continuar mesmo assim ou Ctrl+C para cancelar..."
fi

# Executa o sistema
echo ""
echo "🚀 Iniciando Sistema RAG (CLI)..."
echo "💡 Digite 'sair' para encerrar"
echo ""
python main.py
