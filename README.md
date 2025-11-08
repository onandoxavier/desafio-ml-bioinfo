# 🧬 Desafio de Bioinformática - Classificação de Sequências Proteicas

Projeto de classificação binária de sequências de **proteínas** usando Machine Learning com features específicas de aminoácidos extraídas pela biblioteca MathFeature.

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Accuracy](https://img.shields.io/badge/Accuracy-86.0%25-brightgreen.svg)]()

## 📋 Sobre o Projeto

Este projeto foi desenvolvido para o **Desafio de Ciência de Dados na Bioinformática InteliGente** (Kaggle), onde o objetivo é classificar sequências de **proteínas** (aminoácidos) em duas categorias: Positivo (1) e Negativo (0).

### 🎯 Objetivos
- ✅ Identificar que as sequências são de **proteínas**
- ✅ Extrair features específicas de aminoácidos (AAC, DPC, Entropy)
- ✅ Treinar ensemble de modelos gradient boosting
- ✅ Alcançar alta acurácia (86%+) na classificação

### 📊 Resultados Finais

| Modelo | Acurácia (CV) | ROC-AUC | F1-Score |
|--------|---------------|---------|----------|
| **🏆 Ensemble (Top 3)** | **86.0%** | **94.0%** | **85.8%** |
| LightGBM | 85.3% | 93.4% | 85.2% |
| XGBoost | 85.1% | 93.1% | 84.9% |
| Random Forest | 84.7% | 93.2% | 84.3% |
| CatBoost | 85.1% | 93.1% | 84.9% |
| MLP (sklearn) | 83.0% | 91.8% | 82.8% |
| Keras DNN | 78.9% | - | - |

**Features:** 430 (AAC + DPC + Entropy Shannon)  
**Métrica do Kaggle:** Acurácia

## 🗂️ Estrutura do Projeto

```
desafio_ml_Bioinfo/
├── README.md                          # Este arquivo
├── LICENSE                            # Licença MIT
├── pyproject.toml                     # Configuração do projeto (uv)
│
├── data/                              # Dados do desafio
│   ├── raw/                           # Dados originais
│   │   ├── Pos_train_fasta.txt        # 1.940 sequências positivas
│   │   ├── Neg_train_fasta.txt        # 1.940 sequências negativas
│   │   └── seqs_test.txt              # 970 sequências de teste
│   └── processed/                     # Dados processados
│       ├── train_combined.fasta       # Treino combinado com labels
│       ├── train_features.csv         # 430 features de treino
│       ├── test_features.csv          # 430 features de teste
│       ├── features_aac_*.csv         # AAC (20 features)
│       ├── features_dpc_*.csv         # DPC (400 features)
│       ├── features_entropy_*.csv     # Entropy Shannon (~10)
│       └── submission.csv             # Predições finais (Kaggle)
│
├── notebooks/                         # Análises Jupyter
│   ├── 01_exploracao_dados.ipynb      # EDA + detecção de proteínas
│   ├── 02_feature_engineering.ipynb   # Extração AAC/DPC/Entropy
│   └── 03_modelagem.ipynb             # Baseline + Ensemble + Keras
│
├── results/                           # Resultados e submissões
│   └── submission.csv                 # Última submissão
│
└── MathFeature/                       # Biblioteca clonada
    ├── methods/
    │   ├── ExtractionTechniques-Protein.py  # AAC, DPC, TPC
    │   ├── EntropyClass.py                  # Entropy Shannon
    │   └── Mappings-Protein.py              # Mapeamentos numéricos
    └── ...
```

## �🚀 Como Usar

### 1. Pré-requisitos

- Python 3.11+
- [uv](https://github.com/astral-sh/uv) (gerenciador de pacotes)

### 2. Instalação

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/desafio_ml_Bioinfo.git
cd desafio_ml_Bioinfo

# Crie o ambiente virtual com uv
uv venv .venv
source .venv/bin/activate  # Linux/Mac

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

1. **01_exploracao_dados.ipynb** - EDA e detecção de proteínas
2. **02_feature_engineering.ipynb** - Extração AAC + DPC + Entropy (430 features)
3. **03_modelagem.ipynb** - Baseline + Ensemble + Keras DNN + Predição

### 5. Geração de Submission

O notebook `03_modelagem.ipynb` gera automaticamente o arquivo `results/submission.csv` com as predições do modelo ensemble, pronto para submissão no Kaggle (formato: ID,TARGET).

## 🔧 Tecnologias Utilizadas

- **Python 3.11+** - Linguagem principal
- **uv** - Gerenciador de pacotes e ambiente virtual
- **Biopython** - Manipulação de sequências FASTA
- **MathFeature** - Extração de features de proteínas
- **scikit-learn** - Modelos de ML e pipeline
- **LightGBM, XGBoost, CatBoost** - Gradient boosting
- **TensorFlow/Keras** - Deep learning (exploratório)
- **pandas, numpy** - Manipulação de dados
- **matplotlib, seaborn** - Visualizações

## Metodologia

### 1. Exploração dos Dados (`01_exploracao_dados.ipynb`)
- Análise de 3.880 sequências de treino (1.940 positivas, 1.940 negativas)
- 970 sequências de teste
- **Detecção do tipo de sequência:** Aminoácidos (proteínas)
- Verificação de balanceamento, redundância e caracteres inválidos

### 2. Extração de Features (`02_feature_engineering.ipynb`)
Foram extraídas **430 features** usando a biblioteca **MathFeature** com métodos específicos para proteínas:

- **AAC (Amino Acid Composition):** 20 features
  - Frequência de cada um dos 20 aminoácidos
  - Captura a composição global da proteína
  
- **DPC (Dipeptide Composition):** 400 features
  - Frequência de todos os pares consecutivos de aminoácidos (20x20)
  - Captura padrões locais e ordem das sequências
  
- **Entropy Shannon:** ~3 features
  - Medida de aleatoriedade/complexidade da sequência
  - Cálculo de entropia em diferentes janelas

### 3. Modelagem (`03_modelagem.ipynb`)

#### Baseline com 7 Modelos:
- Logistic Regression
- Random Forest
- XGBoost
- **LightGBM** (melhor individual: 85.3%)
- SVM Linear
- MLP (sklearn)
- CatBoost

#### Ensemble (Voting Classifier):
- Votação dos **top 3 modelos** por acurácia
- Resultado: **86.0% de acurácia** (ganho de ~1% sobre melhor individual)

#### Exploração com Deep Learning:
- Keras DNN (512→256→128→64 neurônios, BatchNorm, Dropout, L2)
- Resultado: 78.9% (inferior aos modelos tree-based)
- Para datasets tabulares pequenos (~4k amostras), gradient boosting supera deep learning

**Validação:** 5-Fold Stratified Cross-Validation

**Nota:** Este projeto foi desenvolvido para fins educacionais como parte do Desafio de Ciência de Dados na Bioinformática InteliGente.
