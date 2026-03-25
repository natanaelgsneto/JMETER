@echo off
:: 1. Entrar na unidade D:
D:

:: 2. Ir para a pasta bin do seu JMeter
cd "D:\Testes de performance Jmeter\apache-jmeter-5.6.3\bin"

:: 3. Executar o comando equivalente ao da sua imagem
:: -n: modo sem interface (CLI)
:: -t: caminho do arquivo de teste
:: -l: caminho onde o log de resultados será salvo
jmeter.bat -n -t "D:\Testes de performance Jmeter\Secao 5- execucao de testes\executando os testes.jmx" -l "D:\Testes de performance Jmeter\Secao 5- execucao de testes\results.jtl"

pause