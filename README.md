# Template de Projeto Flutter

Este projeto serve como um template inicial para novos projetos Flutter. Ele inclui uma estrutura base com:
- Gerenciamento de estado com Provider
- Navegação com GoRouter
- Tratamento de erros com Result
- Logging configurado
- SharedPreferences para armazenamento local

## Renomeando o Projeto

Para renomear o projeto, você precisará alterar os seguintes arquivos:

1. `pubspec.yaml`
   - Alterar o campo `name`
   - Alterar o campo `description`

2. `android/app/build.gradle`
   - Alterar o `applicationId`

3. `ios/Runner.xcodeproj/project.pbxproj`
   - Alterar referências ao nome do projeto

4. `macos/Runner/Configs/AppInfo.xcconfig`
   - Alterar o `PRODUCT_NAME`

5. `windows/runner/main.cpp`
   - Alterar o nome da janela

6. `web/index.html`
   - Alterar o título

## Script de Automação

Para facilitar o processo de renomeação, você pode usar o script abaixo. Salve-o como `rename_project.sh` na raiz do projeto:

```bash
#!/bin/bash

# Verifica se um nome foi fornecido
if [ -z "$1" ]; then
    echo "Por favor, forneça o novo nome do projeto"
    echo "Uso: ./rename_project.sh novo_nome_do_projeto"
    exit 1
fi

NEW_NAME=$1
OLD_NAME="sql_offline"

# Função para substituir texto em arquivos
replace_in_file() {
    local file=$1
    local search=$2
    local replace=$3
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s/$search/$replace/g" "$file"
    else
        # Linux
        sed -i "s/$search/$replace/g" "$file"
    fi
}

# pubspec.yaml
replace_in_file "pubspec.yaml" "name: $OLD_NAME" "name: $NEW_NAME"

# android/app/build.gradle
replace_in_file "android/app/build.gradle" "applicationId \"com.example.$OLD_NAME\"" "applicationId \"com.example.$NEW_NAME\""

# ios/Runner.xcodeproj/project.pbxproj
replace_in_file "ios/Runner.xcodeproj/project.pbxproj" "PRODUCT_NAME = $OLD_NAME" "PRODUCT_NAME = $NEW_NAME"

# macos/Runner/Configs/AppInfo.xcconfig
replace_in_file "macos/Runner/Configs/AppInfo.xcconfig" "PRODUCT_NAME = $OLD_NAME" "PRODUCT_NAME = $NEW_NAME"

# windows/runner/main.cpp
replace_in_file "windows/runner/main.cpp" "window.SetTitle(L\"$OLD_NAME\"" "window.SetTitle(L\"$NEW_NAME\""

# web/index.html
replace_in_file "web/index.html" "<title>$OLD_NAME</title>" "<title>$NEW_NAME</title>"

echo "Projeto renomeado com sucesso para: $NEW_NAME"
echo "Lembre-se de executar 'flutter clean' e 'flutter pub get' após a renomeação"
```

### Como usar o script:

1. Salve o script acima como `rename_project.sh` na raiz do projeto
2. Dê permissão de execução ao script:
   ```bash
   chmod +x rename_project.sh
   ```
3. Execute o script passando o novo nome do projeto:
   ```bash
   ./rename_project.sh novo_nome_do_projeto
   ```

### Após a renomeação:

1. Execute `flutter clean` para limpar o cache
2. Execute `flutter pub get` para atualizar as dependências
3. Verifique se não há erros de compilação
4. Teste o aplicativo em diferentes plataformas

## Observações Importantes

- O novo nome deve seguir as convenções de nomenclatura do Flutter (snake_case)
- Não use caracteres especiais no nome
- Certifique-se de que o nome é único no seu ambiente de desenvolvimento
- Após a renomeação, pode ser necessário limpar o cache do IDE e reiniciá-lo

## Estrutura do Projeto

```
lib/
  ├── data/
  │   ├── models/
  │   ├── repositories/
  │   └── services/
  ├── domain/
  │   ├── entities/
  │   ├── repositories/
  │   └── usecases/
  ├── presentation/
  │   ├── pages/
  │   ├── widgets/
  │   └── controllers/
  └── main.dart
```

## Dependências Principais

- provider: ^6.1.5
- go_router: ^15.1.2
- result_dart: ^2.1.0
- result_command: ^1.3.0
- logging: ^1.3.0
- shared_preferences: ^2.5.3
