#!/usr/bin/env bash
# Script para facilitar tarefas comuns do projeto

set -e

VENV_PATH=".venv"
NOTEBOOKS_DIR="notebooks"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function print_help() {
    echo "Uso: ./run.sh [comando]"
    echo ""
    echo "Comandos disponíveis:"
    echo "  setup         - Configura ambiente inicial"
    echo "  notebook      - Inicia Jupyter Notebook"
    echo "  lab           - Inicia Jupyter Lab"
    echo "  train         - Executa pipeline de treino"
    echo "  test          - Roda testes (se existirem)"
    echo "  clean         - Remove arquivos temporários"
    echo "  help          - Mostra esta mensagem"
}

function setup() {
    echo -e "${GREEN}🚀 Configurando ambiente...${NC}"
    
    # Cria venv se não existir
    if [ ! -d "$VENV_PATH" ]; then
        echo "Criando ambiente virtual..."
        uv venv "$VENV_PATH"
    fi
    
    # Instala dependências
    echo "Instalando dependências..."
    source "$VENV_PATH/bin/activate"
    uv sync
    
    # Clone MathFeature se não existir
    if [ ! -d "MathFeature" ]; then
        echo "Clonando MathFeature..."
        git clone https://github.com/Bonidia/MathFeature.git
    fi
    
    # Cria diretórios necessários
    mkdir -p data/raw data/processed models results
    
    echo -e "${GREEN}✅ Ambiente configurado com sucesso!${NC}"
    echo ""
    echo "Próximos passos:"
    echo "1. Coloque seus arquivos FASTA em data/raw/"
    echo "2. Execute: ./run.sh notebook"
}

function start_notebook() {
    echo -e "${GREEN}📓 Iniciando Jupyter Notebook...${NC}"
    source "$VENV_PATH/bin/activate"
    cd "$NOTEBOOKS_DIR"
    uv run jupyter notebook
}

function start_lab() {
    echo -e "${GREEN}📓 Iniciando Jupyter Lab...${NC}"
    source "$VENV_PATH/bin/activate"
    cd "$NOTEBOOKS_DIR"
    uv run jupyter lab
}

function clean() {
    echo -e "${YELLOW}🧹 Limpando arquivos temporários...${NC}"
    
    # Remove checkpoints do Jupyter
    find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
    
    # Remove cache Python
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
    find . -type f -name "*.pyc" -delete 2>/dev/null || true
    
    echo -e "${GREEN}✅ Limpeza concluída!${NC}"
}

# Main
case "$1" in
    setup)
        setup
        ;;
    notebook)
        start_notebook
        ;;
    lab)
        start_lab
        ;;
    clean)
        clean
        ;;
    help|"")
        print_help
        ;;
    *)
        echo -e "${RED}❌ Comando desconhecido: $1${NC}"
        print_help
        exit 1
        ;;
esac
