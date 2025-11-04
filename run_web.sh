#!/bin/bash
# Script de execução do Sistema RAG - Polícia Federal (Web Interface)
# Executar com: ./run_web.sh

echo "🚀 Sistema RAG - Polícia Federal"
echo "🌐 Modo: Interface Web (Streamlit)"
echo "=" * 50

# Verifica se as dependências estão instaladas
if ! python -c "import streamlit" 2>/dev/null; then
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

# Executa a interface web
echo ""
echo "🚀 Iniciando Interface Web..."
echo "🌍 Acesse em: http://localhost:8501"
echo "💡 Pressione Ctrl+C para encerrar"
echo ""
python -m streamlit run web/app.py
