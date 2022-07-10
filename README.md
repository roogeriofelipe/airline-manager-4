# airline-manager-4-
Automation of Game Airline Manager 4.

## Contribution
If you want to contribute to this project, you can send Pull Request.
If you want to send suggestions for improvements, you can open an issue that we can evaluate for implementation.

Se você quiser contribuir para este projeto, pode enviar Pull Request.
Se você quiser enviar sugestões de melhorias, pode abrir uma edição que podemos avaliar de implementação.

## Installation
Install Airline Manager 4 with bundle

## Requirements
- Ruby
https://www.ruby-lang.org/en/documentation/installation/
- Bundle
https://bundler.io/
- WebDriver
https://chromedriver.chromium.org/downloads

Finally, we need to download ChromeDriver. Pay attention to your Chrome version and ChromeDriver version, which should be the same.
A new page will appear. Select the zip corresponding to your Operating System (Windows in our case) and download it. Extract the file and place it in your Ruby's bin folder. On my computer, the folder is at the following address: C:\Ruby25-x64\bin

Por fim, precisamos baixar o ChromeDriver. Atente-se para a sua versão do Chrome e a versão do ChromeDriver, que deve ser a mesma.
Uma nova página surgirá. Selecione o zip correspondente ao seu Sistema Operacional (Windows no nosso caso) e baixe-o. Extraia o arquivo e o coloque na pasta bin do seu Ruby. No meu computador, a pasta está no seguinte endereço: C:\Ruby25-x64\bin.


## Edit Variables
Edit variable in app.rb, replace the values on brackets {}.
https://www.airline4.net/?gameType=app&uid={YOUR-U-ID}&uid_token={YOUR-U-ID-TOKEN&mail={YOUR-MAIL}&mail_token={YOUR-MAIL-TOKEN}&device={YOUR-DEVICE}&version={YOUR-VERSION}#

## Install Gems
```bash
  bundle install
```
    
## Start App
```bash
  bundle exec rspec app.rb
```
    
