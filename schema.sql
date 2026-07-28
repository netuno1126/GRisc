SET client_encoding = 'UTF-8';


CREATE TABLE IF NOT EXISTS "t_025_glossario_de_termos" (
    "codigo" SERIAL,
    "codtermo" INTEGER,
    "termo" TEXT NOT NULL,
    "fonte" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "acoes_a_executar" (
    "codacexe" SERIAL,
    "acoes" VARCHAR (255)
,
    PRIMARY KEY ("codacexe")
);


CREATE TABLE IF NOT EXISTS "acompanhamento_tratatamento" (
    "acomptratrisc" SERIAL,
    "codrisco" VARCHAR (255),
    "codplanoacao" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "registro_de_acoes" TEXT,
    "anexos" TEXT
,
    PRIMARY KEY ("acomptratrisc")
);


CREATE TABLE IF NOT EXISTS "ambiente_interno_e_processo" (
    "codprocesso" VARCHAR (255) NOT NULL,
    "orgao_om" VARCHAR (255),
    "reparticao" VARCHAR (255),
    "oee_oes" VARCHAR (255),
    "macroprocesso" INTEGER,
    "o_processo_tem_alinhamento_com_a_missao_da_organizacao" BOOLEAN NOT NULL,
    "o_processo_tem_alinhamento_com_a_visao_da_organizacao" BOOLEAN NOT NULL,
    "o_processo_tem_alinhamento_com_os_objetivos_da_organizacao" BOOLEAN NOT NULL,
    "normas_e_regulamentos_utilizados" TEXT,
    "responsavel_pela_analise" VARCHAR (255),
    "imagem" VARCHAR (255),
    "marcado" BOOLEAN NOT NULL,
    "objetivo_processo" VARCHAR (255),
    "processo" VARCHAR (255)
,
    PRIMARY KEY ("codprocesso")
);


CREATE TABLE IF NOT EXISTS "analise_swot" (
    "codigo" VARCHAR (255) NOT NULL,
    "processo" VARCHAR (255),
    "forcas" TEXT,
    "oportunidades" TEXT,
    "fraquezas" TEXT,
    "ameacas" TEXT,
    "analista" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "o_processo_tem_alinhamento_com_os_objetivos_da_organizacao" BOOLEAN NOT NULL,
    "normas_e_regulamentos_utilizados" TEXT,
    "objetivos_do_processo" TEXT,
    "responsavel_pela_analise" VARCHAR (255),
    "imagem" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "aval_probabilidade_impacto_riscos_efetivos" (
    "codavalefet" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "codrisco" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "probabilidade" INTEGER,
    "impacto_p_organizacao" INTEGER NOT NULL,
    "impacto_p_sociedade" INTEGER,
    "impacto_p_pjt_ett_set" INTEGER,
    "impacto_p_stakeholders" INTEGER,
    "impacto_p_imagem_org" INTEGER,
    "impacto_economico_financeiro" INTEGER,
    "imp_p_organizacao" REAL,
    "imp_p_sociedade" REAL,
    "imp_p_pjt_ett_set" REAL,
    "imp_p_stakeholders" REAL,
    "imp_p_imagem_org" REAL,
    "imp_econ_fin" REAL,
    "total" DOUBLE PRECISION,
    "impacto_calculado" DOUBLE PRECISION,
    "pxi" INTEGER,
    "resp_aval" VARCHAR (255)
,
    PRIMARY KEY ("codavalefet")
);


CREATE TABLE IF NOT EXISTS "aval_probabilidade_impacto_riscos_residuais" (
    "codavalresid" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "codriscores" VARCHAR (255),
    "risco_residual" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "probabilidade" INTEGER,
    "impacto_p_organizacao" INTEGER NOT NULL,
    "impacto_p_sociedade" INTEGER,
    "impacto_p_pjt_ett_set" INTEGER,
    "impacto_p_stakeholders" INTEGER,
    "impacto_p_imagem_org" INTEGER,
    "impacto_economico_financeiro" INTEGER,
    "imp_p_organizacao" REAL,
    "imp_p_sociedade" REAL,
    "imp_p_pjt_ett_set" REAL,
    "imp_p_stakeholders" REAL,
    "imp_p_imagem_org" REAL,
    "imp_econ_fin" REAL,
    "total" DOUBLE PRECISION,
    "impacto_calculado" DOUBLE PRECISION,
    "pxi_r" INTEGER,
    "posto_grad_nome_prisc" VARCHAR (255)
,
    PRIMARY KEY ("codavalresid")
);


CREATE TABLE IF NOT EXISTS "avaliacao_probabilidade_x_impacto" (
    "codaval" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "codrisco" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "probabilidade" INTEGER,
    "impacto_p_organizacao" INTEGER NOT NULL,
    "impacto_p_sociedade" INTEGER,
    "impacto_p_pjt_ett_set" INTEGER,
    "impacto_p_stakeholders" INTEGER,
    "impacto_p_imagem_org" INTEGER,
    "impacto_economico_financeiro" INTEGER,
    "imp_p_organizacao" REAL,
    "imp_p_sociedade" REAL,
    "imp_p_pjt_ett_set" REAL,
    "imp_p_stakeholders" REAL,
    "imp_p_imagem_org" REAL,
    "imp_econ_fin" REAL,
    "total" DOUBLE PRECISION,
    "impacto_calculado" DOUBLE PRECISION,
    "pxi" INTEGER,
    "pxi1" INTEGER,
    "posto_grad_nome_prisc" VARCHAR (255)
,
    PRIMARY KEY ("codaval")
);


CREATE TABLE IF NOT EXISTS "categorizacao_da_probabilidade" (
    "cod_prob" SERIAL,
    "i" INTEGER,
    "probabilidade" VARCHAR (255),
    "descricao_da_probabilidade" VARCHAR (255),
    "p" INTEGER
,
    PRIMARY KEY ("cod_prob")
);


CREATE TABLE IF NOT EXISTS "categorizacao_de_fontes_de_risco" (
    "codfont" VARCHAR (255) NOT NULL,
    "fonte_de_risco" VARCHAR (255),
    "descricao" VARCHAR (255)
,
    PRIMARY KEY ("codfont")
);


CREATE TABLE IF NOT EXISTS "categorizacao_do_impacto" (
    "codimp" VARCHAR (255) NOT NULL,
    "impacto" VARCHAR (255),
    "i" INTEGER,
    "explicacao" VARCHAR (255)
,
    PRIMARY KEY ("codimp")
);


CREATE TABLE IF NOT EXISTS "categorizacao_dos_niveis_de_risco_inerente" (
    "pxi" INTEGER NOT NULL,
    "categoria_nivel_risco" VARCHAR (255),
    "categoria_r_residual" VARCHAR (255)
,
    PRIMARY KEY ("pxi")
);


CREATE TABLE IF NOT EXISTS "categorizacao_nivel_risco_residual" (
    "pxi_r" INTEGER NOT NULL,
    "categoria_r_residual" VARCHAR (255)
,
    PRIMARY KEY ("pxi_r")
);


CREATE TABLE IF NOT EXISTS "categorizacao_probabilidade_e_impacto" (
    "codigo" SERIAL,
    "probabilidade" VARCHAR (255),
    "classificacao" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "controle_plan_acao" (
    "codcntrlpac" VARCHAR (255) NOT NULL,
    "codplan_acao" VARCHAR (255),
    "plano_acao" VARCHAR (255),
    "descric_cntrl" VARCHAR (255),
    "data_cntrl" TIMESTAMP WITHOUT TIME ZONE,
    "sit_cntrl" VARCHAR (255),
    "evidencia" TEXT,
    "arq_evidencia" TEXT,
    "resp_controle" VARCHAR (255)
,
    PRIMARY KEY ("codcntrlpac")
);


CREATE TABLE IF NOT EXISTS "controles_de_deteccao" (
    "codcontdetect" SERIAL,
    "controle_de_detecao" VARCHAR (255)
,
    PRIMARY KEY ("codcontdetect")
);


CREATE TABLE IF NOT EXISTS "controles_preventivos" (
    "codcontprevent" SERIAL,
    "controlprevent" VARCHAR (255)
,
    PRIMARY KEY ("codcontprevent")
);


CREATE TABLE IF NOT EXISTS "copia_de_categorizacao_dos_niveis_de_risco_residual" (
    "pxi" INTEGER NOT NULL,
    "categoria_nivel_risco" VARCHAR (255),
    "categoria_r_residual" VARCHAR (255)
,
    PRIMARY KEY ("pxi")
);


CREATE TABLE IF NOT EXISTS "copia_de_processos_criticos" (
    "proccrit" VARCHAR (255) NOT NULL,
    "macroprocesso" INTEGER,
    "processo_critico" VARCHAR (255),
    "organizacao" VARCHAR (255),
    "objetivo_processo" VARCHAR (255),
    "co" VARCHAR (255)
,
    PRIMARY KEY ("proccrit")
);


CREATE TABLE IF NOT EXISTS "demonstracao_de_monitoramento" (
    "codmonit" VARCHAR (255) NOT NULL,
    "codrisco" VARCHAR (255),
    "proccrit" VARCHAR (255)
,
    PRIMARY KEY ("codmonit")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_administrativo" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_economico" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_material" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_meio_ambiente" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_operacional" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_pessoal" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_politico" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_social" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "fator_de_risco_tecnologico" (
    "codigo" SERIAL,
    "fontes_de_risco" VARCHAR (255),
    "fator_de_risco" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "frequencia_de_revisao" (
    "codigo" SERIAL,
    "frequencia_de_revisao" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "gatilhos" (
    "codigo" VARCHAR (255) NOT NULL,
    "gatilho" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "impactos_associados" (
    "codimpac" SERIAL,
    "categoria_do_impacto" VARCHAR (255),
    "impacto" VARCHAR (255)
,
    PRIMARY KEY ("codimpac")
);


CREATE TABLE IF NOT EXISTS "leis_e_normas" (
    "codigo" VARCHAR (255) NOT NULL,
    "norma" VARCHAR (255),
    "link" TEXT
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "macroprocessos" (
    "codigo" SERIAL,
    "macroprocesso" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "mdd_de_monitoramento" (
    "codigo" SERIAL,
    "codrisco" VARCHAR (255),
    "data" DATE,
    "atv_controle" VARCHAR (255),
    "providencias" TEXT,
    "pendencias" VARCHAR (255),
    "eficacia" VARCHAR (255),
    "responsavel" VARCHAR (255),
    "tipo_providencia" VARCHAR (255),
    "atividades_de_controle" VARCHAR (255),
    "parecer_prisc" VARCHAR (255),
    "analise_ch_eqp" VARCHAR (255),
    "despacho_aepg" VARCHAR (255),
    "data_parecer_pric" DATE,
    "data_parecer_ch_eqp" DATE,
    "data_despacho_aepg" DATE
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "objetivos_dos_processos" (
    "codobjproc" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "objetivo_processo" VARCHAR (255)
,
    PRIMARY KEY ("codobjproc")
);


CREATE TABLE IF NOT EXISTS "oee_oes" (
    "codoee_oes" VARCHAR (255) NOT NULL,
    "oee_oes" VARCHAR (255),
    "organizacao" VARCHAR (255)
,
    PRIMARY KEY ("codoee_oes")
);


CREATE TABLE IF NOT EXISTS "orgao_om" (
    "codom" SERIAL,
    "orgao_om" VARCHAR (255) NOT NULL
,
    PRIMARY KEY ("orgao_om")
);


CREATE TABLE IF NOT EXISTS "parametros_de_impactos" (
    "codparimp" VARCHAR (255) NOT NULL,
    "parametros_de_impacto" VARCHAR (255),
    "peso" REAL
,
    PRIMARY KEY ("codparimp")
);


CREATE TABLE IF NOT EXISTS "plano_de_acao" (
    "codplanoacao" VARCHAR (255) NOT NULL,
    "processo_associado" VARCHAR (255),
    "risco_associado" VARCHAR (255),
    "descricao_do_plano_de_acao" TEXT,
    "acao_a_realizar" TEXT,
    "tipo_de_plano_de_acao" VARCHAR (255),
    "quem" TEXT,
    "como" TEXT,
    "onde" TEXT,
    "por_que" VARCHAR (255),
    "custo" NUMERIC(15,2),
    "prazo" TIMESTAMP WITHOUT TIME ZONE,
    "situacao" VARCHAR (255),
    "data_de_avaliacao" TIMESTAMP WITHOUT TIME ZONE,
    "plano_de_acao" VARCHAR (255),
    "risco" VARCHAR (255),
    "responsavel_plano" VARCHAR (255)
,
    PRIMARY KEY ("codplanoacao")
);


CREATE TABLE IF NOT EXISTS "plano_de_tratamento_da_contingencia" (
    "codtratcont" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "codrisco" VARCHAR (255),
    "codplanacao" VARCHAR (255),
    "responsavel_pela_avaliacao" VARCHAR (255),
    "acoes_executadas" TEXT,
    "acoes_a_executar" TEXT,
    "prioridade_de_tratamento" INTEGER,
    "data_da_avaliacao" TIMESTAMP WITHOUT TIME ZONE,
    "frequencia_de_revisao" TEXT
,
    PRIMARY KEY ("codtratcont")
);


CREATE TABLE IF NOT EXISTS "acompanhamento_acoes_de_tratamento" (
    "codacompa" SERIAL,
    "codrisco" VARCHAR (255),
    "codplanoacao" VARCHAR (255),
    "data" TIMESTAMP WITHOUT TIME ZONE,
    "registro_de_acompanhamento" TEXT,
    "anexos" TEXT
,
    PRIMARY KEY ("codacompa")
);


CREATE TABLE IF NOT EXISTS "prioridade_de_tratamento_da_contingencia" (
    "codpriotrat" SERIAL,
    "prioridade" VARCHAR (255)
,
    PRIMARY KEY ("codpriotrat")
);


CREATE TABLE IF NOT EXISTS "prisc" (
    "codigo" VARCHAR (255) NOT NULL,
    "func_prisc" VARCHAR (255),
    "om_secao" VARCHAR (255),
    "posto_grad_nome_prisc" VARCHAR (255),
    "nome_completo" VARCHAR (255)
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "riscos" (
    "nr_risco" VARCHAR (255),
    "codrisco" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "processo" VARCHAR (255),
    "codobjproc" VARCHAR (255),
    "macroprocesso" INTEGER,
    "risco" VARCHAR (255),
    "descricao_risco" VARCHAR (255),
    "oee_oes" VARCHAR (255),
    "eventos" VARCHAR (255),
    "consequencias" TEXT,
    "orgaos_envolvidos" TEXT,
    "classificacao_do_risco" VARCHAR (255),
    "data" TEXT,
    "fator_de_risco_administrativo" TEXT,
    "fator_de_risco_economico" TEXT,
    "fator_de_risco_material" TEXT,
    "fator_de_risco_meio_ambiente" TEXT,
    "fator_de_risco_operacional" TEXT,
    "fator_de_risco_pessoal" TEXT,
    "fator_de_risco_politico" TEXT,
    "fator_de_risco_social" TEXT,
    "fator_de_risco_tecnologico" TEXT,
    "imagem" VARCHAR (255),
    "gatilhos" TEXT,
    "marcado" BOOLEAN NOT NULL,
    "controle_de_deteccao" TEXT,
    "controle_preventivo" TEXT,
    "categoria" VARCHAR (255),
    "posto_grad_nome_prisc" VARCHAR (255)
,
    PRIMARY KEY ("codrisco")
);


CREATE TABLE IF NOT EXISTS "riscos_residuais" (
    "codriscores" VARCHAR (255) NOT NULL,
    "codprocesso" VARCHAR (255),
    "codrisco" VARCHAR (255),
    "risco_residual" VARCHAR (255),
    "descricao_risco" VARCHAR (255),
    "consequencias" TEXT,
    "eventos" VARCHAR (255),
    "orgaos_envolvidos" TEXT,
    "classificacao_do_risco" VARCHAR (255),
    "data" TEXT,
    "fator_de_risco_administrativo" TEXT,
    "fator_de_risco_economico" TEXT,
    "fator_de_risco_material" TEXT,
    "fator_de_risco_meio_ambiente" TEXT,
    "fator_de_risco_operacional" TEXT,
    "fator_de_risco_pessoal" TEXT,
    "fator_de_risco_politico" TEXT,
    "fator_de_risco_social" TEXT,
    "fator_de_risco_tecnologico" TEXT,
    "imagem" VARCHAR (255),
    "fator_de_risco_social1" TEXT,
    "fator_de_risco_tecnologico1" TEXT,
    "imagem1" VARCHAR (255),
    "gatilhos" TEXT,
    "posto_grad_nome_prisc" VARCHAR (255)
,
    PRIMARY KEY ("codriscores")
);


CREATE TABLE IF NOT EXISTS "tratamento_monitoramento_controle" (
    "codigo" VARCHAR (255) NOT NULL,
    "responsavel_pelo_controle" VARCHAR (255),
    "codprocesso" VARCHAR (255),
    "codrisco" VARCHAR (255),
    "controle" TEXT,
    "categoria_do_controle" VARCHAR (255),
    "plano_de_contingencia_associado" VARCHAR (255),
    "estrategia_de_tratamento_do_risco" VARCHAR (255),
    "descricao_da_estrategia_de_tratamento" TEXT,
    "frequencia_de_revisao" TEXT
,
    PRIMARY KEY ("codigo")
);


CREATE TABLE IF NOT EXISTS "usuarios" (
    "usuarioid" SERIAL,
    "login" VARCHAR (50) NOT NULL,
    "senha" VARCHAR (255) NOT NULL,
    "organizacao" VARCHAR (255) NOT NULL,
    "nivelpermissao" SMALLINT,
    "ativo" BOOLEAN NOT NULL
,
    PRIMARY KEY ("usuarioid")
);
