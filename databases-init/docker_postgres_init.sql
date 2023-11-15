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
CREATE TABLE IF NOT EXISTS public.sensor_tag
(
    id serial NOT NULL,
    tag_id integer NOT NULL,
    sensor_id text NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tag_id)
        REFERENCES public.tag (tag_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (sensor_id)
        REFERENCES public.sensor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
CREATE TABLE IF NOT EXISTS public.tag_val
(
    id serial NOT NULL,
    tag_id integer NOT NULL,
    val_id integer NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tag_id)
        REFERENCES public.tag (tag_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	FOREIGN KEY (val_id)
        REFERENCES public.value (val_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
CREATE TABLE IF NOT EXISTS public.tag
(
    tag_id serial NOT NULL,
    tag_name text NOT NULL,
    sensor_id text NOT NULL,
    PRIMARY KEY (tag_id)
);
CREATE TABLE IF NOT EXISTS public.value
(
    val_id serial NOT NULL,
    val_name text NOT NULL,
    PRIMARY KEY (val_id),
);


INSERT INTO site (id, site) VALUES ('11C', 'Laboratorios Fiec');
INSERT INTO equip (id, siteRef, equip) VALUES ('LT1','11C','Papaya');




INSERT INTO tags (tag_name) VALUES ('ac-freq');
INSERT INTO tags (tag_name) VALUES ('active-energy');
INSERT INTO tags (tag_name) VALUES ('active-power');
INSERT INTO tags (tag_name) VALUES ('air-temp');
INSERT INTO tags (tag_name) VALUES ('air-velocity');
INSERT INTO tags (tag_name) VALUES ('apparent-power');
INSERT INTO tags (tag_name) VALUES ('area');
INSERT INTO tags (tag_name) VALUES ('atmospheric-pressure');
INSERT INTO tags (tag_name) VALUES ('ch2o-concentration');
INSERT INTO tags (tag_name) VALUES ('ch4-emission');
INSERT INTO tags (tag_name) VALUES ('cloudage');
INSERT INTO tags (tag_name) VALUES ('co-concentration');
INSERT INTO tags (tag_name) VALUES ('co2-concentration');
INSERT INTO tags (tag_name) VALUES ('co2-emission');
INSERT INTO tags (tag_name) VALUES ('coolingCapacity');
INSERT INTO tags (tag_name) VALUES ('current-angle');
INSERT INTO tags (tag_name) VALUES ('current-imbalance');
INSERT INTO tags (tag_name) VALUES ('current-magnitude');
INSERT INTO tags (tag_name) VALUES ('current-thd');
INSERT INTO tags (tag_name) VALUES ('dewPoint');
INSERT INTO tags (tag_name) VALUES ('direction');
INSERT INTO tags (tag_name) VALUES ('elec-demand');
INSERT INTO tags (tag_name) VALUES ('elec-energy');
INSERT INTO tags (tag_name) VALUES ('elec-power');
INSERT INTO tags (tag_name) VALUES ('enthalpy');
INSERT INTO tags (tag_name) VALUES ('feelsLike');
INSERT INTO tags (tag_name) VALUES ('flow');
INSERT INTO tags (tag_name) VALUES ('freq');
INSERT INTO tags (tag_name) VALUES ('hfc-emission');
INSERT INTO tags (tag_name) VALUES ('humidity');
INSERT INTO tags (tag_name) VALUES ('illuminance');
INSERT INTO tags (tag_name) VALUES ('level');
INSERT INTO tags (tag_name) VALUES ('light-level');
INSERT INTO tags (tag_name) VALUES ('luminance');
INSERT INTO tags (tag_name) VALUES ('luminous-flux');
INSERT INTO tags (tag_name) VALUES ('luminous-intensity');
INSERT INTO tags (tag_name) VALUES ('n2o-emission');
INSERT INTO tags (tag_name) VALUES ('nf3-emission');
INSERT INTO tags (tag_name) VALUES ('nh3-concentration');
INSERT INTO tags (tag_name) VALUES ('no2-concentration');
INSERT INTO tags (tag_name) VALUES ('o3-concentration');
INSERT INTO tags (tag_name) VALUES ('pf');
INSERT INTO tags (tag_name) VALUES ('pfc-emission');
INSERT INTO tags (tag_name) VALUES ('pm01-concentration');
INSERT INTO tags (tag_name) VALUES ('pm10-concentration');
INSERT INTO tags (tag_name) VALUES ('pm25-concentration');
INSERT INTO tags (tag_name) VALUES ('precipitation');
INSERT INTO tags (tag_name) VALUES ('pressure');
INSERT INTO tags (tag_name) VALUES ('reactive-power');
INSERT INTO tags (tag_name) VALUES ('sf6-emission');
INSERT INTO tags (tag_name) VALUES ('solar-irradiance');
INSERT INTO tags (tag_name) VALUES ('speed');
INSERT INTO tags (tag_name) VALUES ('temp');
INSERT INTO tags (tag_name) VALUES ('tvoc-concentration');
INSERT INTO tags (tag_name) VALUES ('vfd-freq');
INSERT INTO tags (tag_name) VALUES ('vfd-speed');
INSERT INTO tags (tag_name) VALUES ('visibility');
INSERT INTO tags (tag_name) VALUES ('volt-angle');
INSERT INTO tags (tag_name) VALUES ('volt-imbalance');
INSERT INTO tags (tag_name) VALUES ('volt-magnitude');
INSERT INTO tags (tag_name) VALUES ('volume');
INSERT INTO tags (tag_name) VALUES ('wetBulb');
INSERT INTO tags (tag_name) VALUES ('wind-direction');
INSERT INTO tags (tag_name) VALUES ('wind-speed');

INSERT INTO value (val_name) VALUES ('m³/s');
INSERT INTO value (val_name) VALUES ('lb');
INSERT INTO value (val_name) VALUES ('BTU/h');
INSERT INTO value (val_name) VALUES ('µg/m³');
INSERT INTO value (val_name) VALUES ('mm');
INSERT INTO value (val_name) VALUES ('Hz');
INSERT INTO value (val_name) VALUES ('cd/m²');
INSERT INTO value (val_name) VALUES ('ppm');
INSERT INTO value (val_name) VALUES ('°F');
INSERT INTO value (val_name) VALUES ('tonref');
INSERT INTO value (val_name) VALUES ('km/h');
INSERT INTO value (val_name) VALUES ('km');
INSERT INTO value (val_name) VALUES ('kg');
INSERT INTO value (val_name) VALUES ('fc');
INSERT INTO value (val_name) VALUES ('%RH');
INSERT INTO value (val_name) VALUES ('m³');
INSERT INTO value (val_name) VALUES ('m/sec');
INSERT INTO value (val_name) VALUES ('kW');
INSERT INTO value (val_name) VALUES ('mph');
INSERT INTO value (val_name) VALUES ('ft/min');
INSERT INTO value (val_name) VALUES ('kVA');
INSERT INTO value (val_name) VALUES ('W/m²');
INSERT INTO value (val_name) VALUES ('ppb');
INSERT INTO value (val_name) VALUES ('kJ/kg');
INSERT INTO value (val_name) VALUES ('A');
INSERT INTO value (val_name) VALUES ('kPa');
INSERT INTO value (val_name) VALUES ('in');
INSERT INTO value (val_name) VALUES ('mbar');
INSERT INTO value (val_name) VALUES ('gal/min');
INSERT INTO value (val_name) VALUES ('lx');
INSERT INTO value (val_name) VALUES ('kWh');
INSERT INTO value (val_name) VALUES ('lm');
INSERT INTO value (val_name) VALUES ('°C');
INSERT INTO value (val_name) VALUES ('gal');
INSERT INTO value (val_name) VALUES ('phot');
INSERT INTO value (val_name) VALUES ('ton');
INSERT INTO value (val_name) VALUES ('mile');
INSERT INTO value (val_name) VALUES ('cd/ft²');
INSERT INTO value (val_name) VALUES ('inHg');
INSERT INTO value (val_name) VALUES ('ft²');
INSERT INTO value (val_name) VALUES ('m²');
INSERT INTO value (val_name) VALUES ('deg');
INSERT INTO value (val_name) VALUES ('psi');
INSERT INTO value (val_name) VALUES ('%');
INSERT INTO value (val_name) VALUES ('kVAR');
INSERT INTO value (val_name) VALUES ('ft³');
INSERT INTO value (val_name) VALUES ('pf');
INSERT INTO value (val_name) VALUES ('L');
INSERT INTO value (val_name) VALUES ('cd');
INSERT INTO value (val_name) VALUES ('BTU/lb');



