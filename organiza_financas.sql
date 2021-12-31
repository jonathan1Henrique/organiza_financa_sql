CREATE SEQUENCE sq_despesas_diarias START WITH 1 INCREMENT BY 1 MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE despesas_diarias(
	id BIGINT NOT NULL DEFAULT NEXTVAL("sq_despesas_diarias"::regclass) CONSTANT despesas_diarias_pkey PRIMARY KEY,
	descricao VARCHAR(50),
	dia DATE,
	valor DECIMAL
);

CREATE SEQUENCE sq_despesas_mensais START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE despesas_mensais(
	id BIGINT NOT NULL DEFAULT NEXTVAL('sq_despesas_mensais'::regclass) CONSTRAINT despesas_mensais_pkey PRIMARY KEY,
	total_gasto DECIMAL,
	orcamento_mes DECIMAL,
	despesas_diarias BIGINT CONSTRAINT despesas_diarias_despesas_mensais REFERENCES despesas_diarias(id)
);