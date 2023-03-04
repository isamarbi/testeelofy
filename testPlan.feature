Feature | Interface de Configuração de Réguas

Scenario: Validação da tela "Criar/Editar régua" 
Given que deseja acessar a tela "Criar/Editar régua"
And tenha as permissões necessárias
When clica no botão que direciona a tela "Criar/Editar régua"
Then deve ver a div "Informações Básicas"
And deve ver o título "Nome da régua"
And abaixo do título um campo para digitar
And deve ver o título "Tamanho da régua"
And abaixo do título um dropdown, com as opções: "Escala de 1", "Escala de 2", "Escala de 3", "Escala de 4", "Escala de 5", "Escala de 6" e "Escala de 7"
And deve ver a descrição "Status da régua"
And ao lado a toggle seguido do status: "Ativo" ou "Inativo"
And deve ver a div "Monte sua régua"
And deve ver a aba "Geral"
And deve ver uma tabela com as colunas: "Score", "Nome", "Valor mín.", "Valor máx." e "Não aplica?"
And deve ver na mesma tabela o número de linhas equivalente ao selecionado no dropdown "Tamanho da régua"
And deve ver em cada linha na coluna "Score" o campo increment e decrement counter
And deve ver em cada linha na coluna "Nome" o campo com a descrição "Nome da opção"
And deve ver em cada linha na coluna "Valor mín." o campo increment e decrement counter
And deve ver em cada linha na coluna "Valor máx." o campo increment e decrement counter
And deve ver em cada linha na coluna "Não aplica?" o toggle seguido do status "Sim" ou "Não"
And deve ver os botões "Cancelar" e "Salvar"

Scenario: Validação da tela "Criar/Editar régua" na aba "Extras"
Given que esteja na tela "Criar/Editar régua"
When clica na aba "Extras" na div "Monte sua régua"
Then deve ver uma tabela com as colunas: "Score", "Legenda", "Cor" e "Comentário"
And deve ver na mesma tabela o número de linhas equivalente ao selecionado no dropdown "Tamanho da régua"
And deve ver em cada linha na coluna "Score" o campo para digitar números
And deve ver em cada linha na coluna "Legenda" o campo com a descrição "Nome da legenda"
And deve ver em cada linha na coluna "Cor" o campo com opções de cor 
And deve ver em cada linha na coluna "Comentário" o toggle seguido do status "Obrigatório" ou "Não Obrigatório"

Scenario: Validação de cadastro/edição com sucesso
Given que esteja na tela "Criar/Editar régua"
And preencha todas as informações necessárias
When clica no botão "Salvar"
Then será redirecionado a tela de lista de réguas já cadastradas no sistema
And as informações devem ser atualizadas na listagem

Scenario: Validação do botão "Cancelar"
Given que esteja na tela "Criar/Editar régua"
And preencha todas as informações necessárias
When clica no botão "Cancelar"
Then será redirecionado a tela de lista de réguas já cadastradas no sistema
And as informações não devem ser atualizadas na listagem

Scenario: Validação de campos em branco
Given que esteja na tela "Criar/Editar régua"
And mantenha no campo <campo> o valor em branco
When clica em "Salvar"
Then deve ver uma mensagem 
And deve ver o campo <campo> destacado em vermelho
Examples:
| campo            | 
| Nome             |
| Nome da régua    |
| Tamanho da régua |

Scenario: Validação dos campos increment e decrement negativos
Given que esteja na tela "Criar/Editar régua"
When tenta decrementar no campo <campo> um valor abaixo de 0
Then não deve ocorrer alteração
Examples:
| campo          |
| Score (Geral)  |
| Score (Extras) |
| Valor mín.     |
| Valor máx.     |

Scenario: Validação de lacunas
Given que esteja na tela "Criar/Editar régua"
And preenche as informações na div "Monte sua régua"
And preenche o "Valor mín." do próximo ponto com intervalo maior que 0,01 do "Valor máx." do ponto anterior
When clica no botão "Salvar"
Then deve ver uma mensagem 
And deve ver o campo "Valor mín." destacado em vermelho

Scenario: Validação de valores repetidos
Given que esteja na tela "Criar/Editar régua"
And preenche as informações na div "Monte sua régua"
And preenche o "Valor mín." do próximo ponto com valor igual ao "Valor máx." do ponto anterior
When clica no botão "Salvar"
Then deve ver uma mensagem 
And deve ver o campo "Valor mín." destacado em vermelho

Scenario: Validação dos campos "Valor mín." e "Valor máx." maiores que o valor do "Score"
Given que esteja na tela "Criar/Editar régua"
And preenche as informações na div "Monte sua régua"
And preenche o "Valor mín." e "Valor máx." com intervalo maior do que o valor definido no "Score"
When clica no botão "Salvar"
Then deve ver uma mensagem 
And deve ver os campos "Valor mín." e "Valor máx." destacados em vermelho

Scenario: Validação de tipagem
Given que esteja na tela "Criar/Editar régua"
When tenta digitar letras e caracteres especiais no campo <campo> 
Then não deve permitir a inclusão
Examples:
| campo          |
| Score (Geral)  |
| Score (Extras) |

Scenario: Validação do comentário obrigatório
Given que está preenchendo uma régua previamente cadastrada
And o comentário foi marcado como <campo>
When chegar na opção "Comentário"
Then <ação> prosseguir sem preencher o campo
Examples:
| campo       | ação       |
| obrigatório | não poderá |
| opcional    | poderá     |