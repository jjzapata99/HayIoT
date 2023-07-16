CREATE TABLE IF NOT EXISTS public.site
(
    id "text" NOT NULL,
    site "text",
    CONSTRAINT site_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.equip
(
    id "text" NOT NULL,
    "siteref" "text",
    equip "text",
    CONSTRAINT equip_pkey PRIMARY KEY (id),
    CONSTRAINT fk_site FOREIGN KEY ("siteref")
        REFERENCES public.site (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.sensor
(
    id "text" NOT NULL,
    "siteref" "text",
    "equipref" "text",
    "type" "text",
    "description" "text",
    CONSTRAINT sensor_pkey PRIMARY KEY (id),
    CONSTRAINT fk_equip FOREIGN KEY ("equipref")
        REFERENCES public.equip (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_ssite FOREIGN KEY ("siteref")
        REFERENCES public.site (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
);
INSERT INTO site (id, site) VALUES ('11C', 'Laboratorios Fiec');
INSERT INTO equip (id, siteRef, equip) VALUES ('LT1','11C','Papaya');
