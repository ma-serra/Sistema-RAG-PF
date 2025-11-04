@echo off
REM Script de execução do Sistema RAG - Polícia Federal (Web Interface)
REM Executar com: run_web.bat

echo 🚀 Sistema RAG - Polícia Federal
echo 🌐 Modo: Interface Web (Streamlit)
echo ==================================================

REM Verifica se as dependências estão instaladas
python -c "import streamlit" >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Dependências não encontradas. Instalando...
    pip install -r requirements.txt
)

REM Verifica se a pasta SGP existe
if not exist "SGP" (
    echo 📁 Criando pasta SGP/ para documentos...
    mkdir SGP
    echo ⚠️  Adicione arquivos PDF na pasta SGP/ antes de usar o sistema
)

REM Verifica se Ollama está rodando
curl -s http://localhost:11434/api/tags >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Ollama não está rodando!
    echo 💡 Execute em outro terminal: ollama serve
    echo 💡 Ou instale: https://ollama.ai/
    pause
)

REM Executa a interface web
echo.
echo 🚀 Iniciando Interface Web...
echo 🌍 Acesse em: http://localhost:8501
echo 💡 Pressione Ctrl+C para encerrar
echo.
python -m streamlit run web/app.py
