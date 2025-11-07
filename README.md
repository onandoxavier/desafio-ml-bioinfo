# 🧬 Desafio de Bioinformática Inteligente

Projeto de classificação de sequências biológicas usando Machine Learning e extração de features baseada em redes complexas.

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📋 Sobre o Projeto

Este projeto foi desenvolvido para o **Desafio de Ciência de Dados na Bioinformática Inteligente**, onde o objetivo é classificar sequências biológicas (DNA/RNA) em duas categorias: Positivo e Negativo.

### 🎯 Objetivos
- Extrair features de sequências biológicas usando técnicas de redes complexas
- Treinar modelos de Machine Learning para classificação binária
- Alcançar alta performance (F1-Score) na predição de sequências

### 📊 Resultados
- **Melhor Modelo:** Random Forest (tunado)
- **F1-Score (CV):** 69.6%
- **Features:** 79 (baseadas em grafos de k-mers)

## 🗂️ Estrutura do Projeto

```
desafio_CD_Bioinfo/
├── README.md                          # Este arquivo
├── LICENSE                            # Licença MIT
├── pyproject.toml                     # Dependências (gerenciadas com uv)
├── .gitignore                         # Arquivos ignorados pelo Git
│
├── data/                              # Dados (não versionados)
│   ├── raw/                           # Dados brutos (FASTA)
│   └── processed/                     # Features extraídas e submissions
│
├── notebooks/                         # Análises exploratórias
│   ├── 01_exploracao_dados.ipynb      # EDA inicial
│   ├── 02_feature_engineering.ipynb   # Extração de features
│   └── 03_modelagem.ipynb             # Modelagem e predição
│
├── models/                            # Modelos treinados (não versionados)
├── results/                           # Gráficos e resultados
├── src/                               # Código Python modular (opcional)
└── MathFeature/                       # Biblioteca externa (não versionada)
```

## 🚀 Como Usar

### 1. Pré-requisitos

- Python 3.11+
- [uv](https://github.com/astral-sh/uv) (gerenciador de pacotes)

### 2. Instalação

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/desafio_CD_Bioinfo.git
cd desafio_CD_Bioinfo

# Crie o ambiente virtual com uv
uv venv .venv
source .venv/bin/activate  # Linux/Mac
# ou
.venv\Scripts\activate  # Windows

# Instale as dependências
uv sync

# Clone a biblioteca MathFeature
git clone https://github.com/Bonidia/MathFeature.git
```

### 3. Preparação dos Dados

Coloque os arquivos FASTA na pasta `data/raw/`:
- `Pos_train_fasta.txt` - Sequências positivas (treino)
- `Neg_train_fasta.txt` - Sequências negativas (treino)
- `seqs_test.txt` - Sequências de teste

### 4. Execução dos Notebooks

Execute os notebooks na ordem:

```bash
# Inicia o Jupyter
uv run jupyter notebook

# Ou use JupyterLab
uv run jupyter lab
```

1. **01_exploracao_dados.ipynb** - Análise exploratória inicial
2. **02_feature_engineering.ipynb** - Extração de features com MathFeature
3. **03_modelagem.ipynb** - Treino, tuning e predição

### 5. Geração de Submission

O notebook `03_modelagem.ipynb` gera automaticamente o arquivo `data/processed/submission.csv` pronto para submissão no Kaggle.

## 🔬 Metodologia

### Extração de Features
- **Técnica:** ComplexNetworksClass-v2 (MathFeature)
- **Tipo:** Métricas de grafos construídos a partir de k-mers
- **Features geradas:** 79 (betweenness, degree, clustering, etc.)

### Modelos Testados
1. Logistic Regression (baseline)
2. Random Forest ✅ (melhor)
3. XGBoost
4. LightGBM
5. SVM

### Otimização
- **Cross-Validation:** Stratified 5-Fold
- **Hyperparameter Tuning:** RandomizedSearchCV (50 iterações)
- **Métrica principal:** F1-Score

## 📦 Dependências Principais

- **biopython** - Manipulação de sequências biológicas
- **scikit-learn** - Modelos de ML e validação
- **xgboost** - Gradient boosting
- **lightgbm** - Gradient boosting eficiente
- **pandas** - Manipulação de dados
- **matplotlib/seaborn** - Visualizações
- **python-igraph** - Análise de grafos (MathFeature)

Ver `pyproject.toml` para lista completa.

## 📈 Possíveis Melhorias

- [ ] Adicionar k-mers features (frequências de subsequências)
- [ ] Testar Entropy e Chaos Game Theory features
- [ ] Implementar ensemble (Voting/Stacking)
- [ ] Feature selection (remover features redundantes)
- [ ] Testar redes neurais (LSTM para sequências)

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:
- Reportar bugs
- Sugerir novas features
- Enviar pull requests

## 📄 Licença

Este projeto está sob a licença MIT. Veja [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores

- **Jonathan** - [GitHub](https://github.com/seu-usuario)

## 🙏 Agradecimentos

- [MathFeature](https://github.com/Bonidia/MathFeature) - Biblioteca de extração de features
- Professores e organizadores do desafio
- Comunidade de Bioinformática

---

**Nota:** Este projeto foi desenvolvido para fins educacionais como parte do Desafio de Ciência de Dados na Bioinformática Inteligente.
