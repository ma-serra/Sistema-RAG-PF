# 🚀 Guia de Execução - Sistema RAG PF

Este guia explica como executar a aplicação Sistema RAG-PF de forma simples e rápida.

## 📋 Pré-requisitos

Antes de executar a aplicação, certifique-se de ter:

1. **Python 3.11 ou superior** instalado
2. **Ollama** instalado e rodando (`ollama serve`)
3. **Dependências Python** instaladas
4. **Documentos PDF** na pasta `SGP/`

## ⚡ Execução Rápida (Recomendado)

### 🌐 Interface Web (Streamlit)

A interface web é a forma mais fácil e visual de usar o sistema.

**Linux/Mac:**
```bash
./run_web.sh
```

**Windows:**
```cmd
run_web.bat
```

Após executar, acesse no navegador: **http://localhost:8501**

### 💻 Interface CLI (Linha de Comando)

Para usar via terminal de forma interativa.

**Linux/Mac:**
```bash
./run.sh
```

**Windows:**
```cmd
run.bat
```

## 📝 Execução Manual

Se preferir executar manualmente sem os scripts:

### Interface Web
```bash
python -m streamlit run web/app.py
```

### Interface CLI
```bash
python main.py
```

## 🔧 Solução de Problemas

### Erro: "Permission denied" (Linux/Mac)

Torne os scripts executáveis:
```bash
chmod +x run.sh run_web.sh install.sh
```

### Erro: "Ollama não está rodando"

Execute em outro terminal:
```bash
ollama serve
```

Ou instale o Ollama: https://ollama.ai/

### Erro: "Dependências não encontradas"

Execute a instalação:

**Linux/Mac:**
```bash
./install.sh
```

**Windows:**
```cmd
install.bat
```

Ou manualmente:
```bash
pip install -r requirements.txt
ollama pull nomic-embed-text
ollama pull llama3.2
```

### Erro: "Pasta SGP/ não encontrada"

Crie a pasta e adicione seus PDFs:
```bash
mkdir SGP
# Copie seus arquivos PDF para a pasta SGP/
```

### Erro: "streamlit command not found" (Windows)

Use sempre:
```bash
python -m streamlit run web/app.py
```

## 🎯 Modos de Execução Avançados

### Executar com Backend Qdrant
```bash
PF_RAG_VECTOR_DB=qdrant python main.py
```

### Executar com FAISS (compatibilidade)
```bash
PF_RAG_VECTOR_DB=faiss python main.py
```

### Modo Verbose (Debug)
```bash
PF_RAG_VERBOSE=true python main.py
```

### Forçar Reconstrução da Base
```bash
rm -rf faissDB/ qdrantDB/
python main.py
```

### Executar Web em Porta Customizada
```bash
python -m streamlit run web/app.py --server.port 8080
```

### Executar Web Acessível na Rede
```bash
python -m streamlit run web/app.py --server.address 0.0.0.0
```

## 📊 Fluxo de Trabalho Típico

1. **Instalação (primeira vez)**
   ```bash
   ./install.sh  # ou install.bat no Windows
   ```

2. **Adicionar Documentos**
   - Copie PDFs para a pasta `SGP/`

3. **Iniciar Ollama** (em terminal separado)
   ```bash
   ollama serve
   ```

4. **Executar Aplicação**
   ```bash
   ./run_web.sh  # ou run_web.bat no Windows
   ```

5. **Usar o Sistema**
   - Acesse http://localhost:8501
   - Faça upload de PDFs pela interface
   - Faça perguntas ao sistema

## ✨ Recursos dos Scripts de Execução

Os scripts `run.sh`, `run.bat`, `run_web.sh` e `run_web.bat` fazem automaticamente:

✅ Verificam se as dependências estão instaladas
✅ Criam a pasta `SGP/` se não existir
✅ Verificam se o Ollama está rodando
✅ Fornecem mensagens de erro claras e soluções
✅ Iniciam a aplicação no modo correto

## 🆘 Precisa de Ajuda?

1. Verifique se o Ollama está rodando: `ollama --version`
2. Verifique as dependências: `pip list | grep langchain`
3. Consulte os logs de erro para detalhes
4. Veja a documentação completa no `README.md`

## 🔗 Links Úteis

- **Ollama**: https://ollama.ai/
- **Streamlit**: https://streamlit.io/
- **Documentação Principal**: [README.md](README.md)
- **Arquitetura**: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- **Changelog**: [docs/CHANGELOG.md](docs/CHANGELOG.md)
