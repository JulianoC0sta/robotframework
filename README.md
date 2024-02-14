# Desafio de Teste Automatizado com Robot Framework

Este projeto é um exemplo de automação de teste utilizando Robot Framework para realizar testes automatizados em um site de e-commerce.

## Configuração do Ambiente

### Pré-requisitos

Antes de executar os testes automatizados, é necessário ter o seguinte ambiente configurado:

- Python (versão 3.6 ou superior) instalado. Você pode baixar e instalar o Python a partir do [site oficial](https://www.python.org/downloads/).

- Gerenciador de pacotes pip atualizado. Geralmente, o pip é instalado automaticamente com o Python. Para atualizá-lo, execute o seguinte comando no terminal:

    ```
    pip install --upgrade pip
    ```

- Instalação do Robot Framework. Você pode instalar o Robot Framework executando o seguinte comando no terminal:

    ```
    pip install robotframework
    ```

- Browser (por exemplo, Google Chrome ou Firefox) instalado no sistema.

### Instalação das Dependências

Após configurar o ambiente, é necessário instalar as dependências do projeto. Para fazer isso, execute o seguinte comando no terminal na raiz do projeto:

  ```
  pip install -r requirements.txt
  ```


Este comando irá instalar todas as dependências listadas no arquivo `requirements.txt`.

### Extensão Cucumber (Opcional)

Se desejar utilizar a sintaxe do Cucumber para escrever seus casos de teste, você pode instalar a extensão do Cucumber para o Robot Framework. Para fazer isso, execute o seguinte comando no terminal:

  ```
  pip install robotframework-cucumber
  ```

  
## Executando os Testes

Para executar os testes automatizados, siga as etapas abaixo:

1. Navegue até o diretório raiz do projeto no terminal.

2. Execute o seguinte comando para rodar os testes:

    ```
    robot <nome_do_arquivo_de_teste>.robot
    ```

    Substitua `<nome_do_arquivo_de_teste>.robot` pelo nome do arquivo de teste que deseja executar.

## Estrutura do Projeto

- `BDDpt-br`: Este arquivo define as palavras-chave (keywords) utilizando a sintaxe do idioma Português Brasileiro. Ele é referenciado pelo arquivo Features.robot para fornecer os passos dos testes em português.


- `Features`: Este arquivo define os casos de teste utilizando a sintaxe Gherkin. Ele referencia os arquivos ResourceBDD.robot e BDDpt-br.robot para definir os passos dos testes.


- `ResourceBDD`: Este arquivo contém as palavras-chave (keywords) e variáveis necessárias para realizar os testes automatizados. Ele é referenciado pelo arquivo Features.robot para fornecer os passos dos testes.

- `_config.yml`: Este arquivo contém as configurações para a execução dos testes automatizados no GitLab CI/CD. Ele define as etapas de construção, variáveis de ambiente e comandos de script necessários para executar os testes.

- `.gitignore`: Este arquivo especifica quais arquivos e pastas devem ser ignorados pelo Git ao rastrear as mudanças no repositório. Isso geralmente inclui arquivos temporários, arquivos gerados e outras pastas que não são relevantes para o controle de versão do seu projeto.

## Contribuição

Contribuições são bem-vindas! Se você tiver sugestões, correções de bugs ou novos recursos para adicionar, sinta-se à vontade para abrir uma issue ou enviar um pull request.



