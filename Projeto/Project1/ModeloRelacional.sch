table CLIENTE
(
  _ Codigo _ , 
  Nome ,
  Plano , 
  DataNasc ,
  Email ? ,
  MNum ,
  MRua ,
  MAndar ? ,
  MCodPostal ,
  MLocalidade ,
  Treinador --> FUNCIONARIO.CodigoFunc,
  Nutricionista --> FUNCIONARIO.CodigoFunc 
)

table FUNCIONARIO
(
  _ CodigoFunc _ ,
  Cargo,
  Nome ,
  Salário ,
  DataNasc ,
  Email ,
  MNum ,
  MRua ,
  MAndar ? ,
  MCodPostal ,
  MLocalidade ,
  Espaço --> ESPAÇO.CodEspaço ,
  HoraInic ,
  HoraFim 
)

table ESPAÇO
(
  _ CodEspaço _ ,
  Nome ,
  MNum ,
  MRua ,
  MAndar ? ,
  MCodPostal ,
  MLocalidade ,
  Gestor --> FUNCIONARIO.CodigoFunc,
  Fornecedor --> FORNECEDOR.Nome
)

table FORNECEDOR
(
  _ Nome _ ,
  Email ,
  Custo ,
  Propósito ,
  MNum ,
  MRua ,
  MAndar ? ,
  MCodPostal ,
  MLocalidade 
)

table NUM_TELEF_CLIENTE
(
  _ Cliente _ --> CLIENTE.Codigo ,
  _ Num _
)

table NUM_TELEF_FUNCIONARIO
(
  _ Funcionário _ --> FUNCIONARIO.CodigoFunc ,
  _ Num _
)

table NUM_TELEF_FORNECEDOR
(
  _ Fornecedor _ --> FORNECEDOR.Nome ,
  _ Num _
)

table FORNECE
(
  _ Fornecedor _ --> FORNECEDOR.Nome ,
  _ Espaço _ --> ESPAÇO.CodEspaço
)

table FREQUENTA 
(
  _ Cliente _ --> CLIENTE.Codigo,
  _ Espaço _ --> ESPAÇO.CodEspaço
)
