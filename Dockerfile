FROM justb4/jmeter:5.5

# Cria a pasta de trabalho dentro do container
WORKDIR /tests

# Copia tudo o que está no seu GitHub para dentro do container
COPY . /tests

# Comando para rodar o teste, gerar o log e o dashboard
ENTRYPOINT ["jmeter", "-n", "-t", "Completo.jmx", "-l", "resultados.jtl", "-e", "-o", "dashboard_report"]
