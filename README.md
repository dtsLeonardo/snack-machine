# Máquina de Salgadinho em VHDL

## Descrição do Projeto

Este projeto implementa uma máquina de salgadinhos utilizando a linguagem VHDL. A máquina permite ao usuário inserir a quantidade de salgadinhos desejada, o preço por unidade e o dinheiro inserido, retornando o troco adequado. O design do sistema é modular e inclui componentes básicos como comparadores e somadores, além dos controladores principais que gerenciam o fluxo de operação da máquina.

## Estrutura do Projeto

O projeto é dividido em várias entidades VHDL, cada uma responsável por uma parte específica da funcionalidade do sistema. Abaixo está a lista das principais entidades e sua descrição:

### 1. Controladores
- **Controlador Principal**: Gerencia a lógica de controle geral da máquina, incluindo a validação das entradas e a coordenação das operações dos outros componentes.
- **Controlador de Entrada**: Recebe e valida a quantidade de salgadinhos, o preço por unidade e o dinheiro inserido.
- **Controlador de Troco**: Calcula o troco a ser devolvido ao usuário com base nas entradas fornecidas.

### 2. Componentes Básicos
- **Comparador**: Compara dois valores e determina se são iguais, diferentes, maior ou menor.
- **Somador**: Realiza operações de adição necessárias para calcular o total a ser pago e o troco.

## Instalação e Configuração

1. **Ferramentas Necessárias**:
   - Simulador VHDL (ModelSim, GHDL, etc.)
   - Ambiente de desenvolvimento VHDL (Vivado, Quartus, etc.)

2. **Download do Código**:
   Baixe ou clone o repositório contendo os arquivos VHDL do projeto.

3. **Configuração do Ambiente**:
   Abra o ambiente de desenvolvimento VHDL de sua escolha e crie um novo projeto. Adicione todos os arquivos VHDL do repositório ao projeto.

## Como Usar

1. **Configuração Inicial**:
   - Configure os sinais de entrada para a quantidade de salgadinhos, preço por unidade e dinheiro inserido.
   - Assegure-se de que os sinais de clock e reset estejam devidamente configurados.

2. **Simulação**:
   - Compile todos os arquivos VHDL.
   - Execute a simulação e observe os sinais de saída para verificar o troco calculado.

3. **Síntese (Opcional)**:
   - Caso deseje implementar o projeto em hardware, proceda com a síntese do projeto utilizando a ferramenta adequada para o seu FPGA ou CPLD.

## Exemplos de Uso

Aqui estão alguns exemplos de entradas e saídas esperadas para a máquina de salgadinhos:

### Exemplo 1
- **Entrada**:
  - Quantidade de Salgadinhos: 2
  - Preço por Unidade: 3
  - Dinheiro Inserido: 10
- **Saída**:
  - Troco: 4

### Exemplo 2
- **Entrada**:
  - Quantidade de Salgadinhos: 1
  - Preço por Unidade: 5
  - Dinheiro Inserido: 5
- **Saída**:
  - Troco: 0

## Estrutura de Arquivos

- `controlador_principal.vhd`: Lógica de controle principal.
- `controlador_entrada.vhd`: Gerenciamento das entradas.
- `controlador_troco.vhd`: Cálculo do troco.
- `comparador.vhd`: Comparações necessárias para a lógica do sistema.
- `somador.vhd`: Operações de soma.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorar o projeto.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

---
