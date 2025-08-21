# Projeto Lógico de Banco de Dados para Oficina de Veículos
# Contexto

Este projeto representa o modelo lógico de banco de dados para uma oficina de veículos.
O objetivo é controlar clientes, veículos, ordens de serviço, mecânicos, equipes, peças e serviços realizados, permitindo uma visão detalhada da operação da oficina.

# Estrutura do Esquema

- Cliente → cadastro de clientes da oficina.

- Veiculo → veículos pertencentes aos clientes.

- Mecanico → profissionais da oficina.

- Equipe → times de mecânicos.

- Equipe_Mecanico → relação N:N entre equipes e mecânicos.

- Ordem_de_Servico → solicitações de manutenção/serviços.

- Peca → peças utilizadas em reparos.

- OS_Peca → relação N:N entre ordens de serviço e peças.

- Servico → serviços prestados (ex: troca de óleo).

- OS_Servico → relação N:N entre ordens de serviço e serviços.

# Regras de Negócio

Cada cliente pode ter vários veículos.

Cada veículo pode gerar várias ordens de serviço.

Uma ordem de serviço está ligada a uma equipe.

Uma equipe pode ter vários mecânicos.

Uma ordem de serviço pode incluir peças e serviços, em diferentes quantidades.

O valor total de uma ordem é calculado a partir da soma de peças e serviços.

# Exemplos de Consultas

Listar os veículos de cada cliente.

Quais serviços foram realizados em cada OS.

Quais peças foram utilizadas em cada OS.

Qual o valor total de cada OS.

Quais mecânicos pertencem a cada equipe.

# Conclusão

Este esquema lógico fornece uma visão clara e robusta da gestão de uma oficina mecânica, servindo como base para consultas SQL, geração de relatórios e até o desenvolvimento de sistemas de gestão automotiva.
