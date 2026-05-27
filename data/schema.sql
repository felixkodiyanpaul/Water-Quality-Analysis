-- Water quality analysis
-- realtional schema in third normal form (3NF)
-- Table 1 : lake
CREATE Table lake(
    lake_id SERIAL PRIMARY KEY,
    lake_name VARCHAR(200) NOT NULL,
    region VARCHAR(100) NOT NULL,
    UNIQUE(lake_name,region)
);

-- Table 2 : sampling station
CREATE TABLE sampling_station(
    station_id SERIAL PRIMARY KEY,
    station_code VARCHAR(50) NOT NULL UNIQUE,
    station_name VARCHAR(200) NOT NULL,
    coordinates  VARCHAR(100),
    lake_id INT NOT NULL REFERENCES lake(lake_id)

);

--Table 3: sampling event
CREATE TABLE sampling_event (
    event_id    SERIAL PRIMARY KEY,
    station_id  INT  NOT NULL REFERENCES sampling_station(station_id),
    sampled_on  DATE NOT NULL,
    UNIQUE (station_id, sampled_on)
);
-- Table 4: water_quality_measurement
CREATE TABLE water_quality_measurement (
    measurement_id              SERIAL PRIMARY KEY,
    event_id                    INT NOT NULL UNIQUE REFERENCES sampling_event(event_id),
    water_temperature_c         FLOAT,   -- °C        (CSV: vandens_temp)
    suspended_solids_mg_l       FLOAT,   -- mg/L      (CSV: suspend_medziagos)
    alkalinity_mmol_l           FLOAT,   -- mmol/L    (CSV: sarmingumas)
    dissolved_oxygen_mg_l       FLOAT,   -- mg/L      (CSV: deguonis_istirpes)
    ph                          FLOAT,   -- no unit   (CSV: ph)
    transparency_m              FLOAT,   -- m         (CSV: skaidrumas)
    conductivity_us_cm          FLOAT,   -- µS/cm     (CSV: elektr_laidis)
    bod5_mg_l                   FLOAT,   -- mg/L      (CSV: biochem_deg_suvartojimas)
    ammonium_nitrogen_mg_l      FLOAT,   -- mg/L      (CSV: amonio_azotas)
    nitrite_nitrogen_mg_l       FLOAT,   -- mg/L      (CSV: nitritu_azotas)
    nitrate_nitrogen_mg_l       FLOAT,   -- mg/L      (CSV: nitratu_azotas)
    mineral_nitrogen_mg_l       FLOAT,   -- mg/L      (CSV: azotas_mineralinis)
    total_nitrogen_mg_l         FLOAT,   -- mg/L      (CSV: azotas_bendras)
    phosphate_phosphorus_mg_l   FLOAT,   -- mg/L      (CSV: fosfatu_fosforas)
    total_phosphorus_mg_l       FLOAT,   -- mg/L      (CSV: fosforas_bendras)
    carbon_mg_l                 FLOAT,   -- mg/L      (CSV: anglingumas)
    chlorophyll_a_ug_l          FLOAT,   -- µg/L      (CSV: chlorofilas_a)
    calcium_carbonate_mg_l      FLOAT,   -- mg/L      (CSV: kalcio_karbonatas)
    mercury_ug_l                FLOAT,   -- µg/L      (CSV: gyvsidabris)
    cadmium_ug_l                FLOAT,   -- µg/L      (CSV: kadmis)
    nickel_ug_l                 FLOAT,   -- µg/L      (CSV: nikelis)
    lead_ug_l                   FLOAT,   -- µg/L      (CSV: svinas)
    copper_ug_l                 FLOAT,   -- µg/L      (CSV: varis)
    chromium_ug_l               FLOAT,   -- µg/L      (CSV: chromas)
    vanadium_ug_l               FLOAT,   -- µg/L      (CSV: vanadis)
    aluminium_ug_l              FLOAT,   -- µg/L      (CSV: aliuminis)
    tin_ug_l                    FLOAT,   -- µg/L      (CSV: alavas)
    arsenic_ug_l                FLOAT,   -- µg/L      (CSV: arsenas)
    zinc_ug_l                   FLOAT,   -- µg/L      (CSV: cinkas)
    anthracene_ug_l             FLOAT,   -- µg/L      (CSV: antracenas)
    fluoranthene_ug_l           FLOAT,   -- µg/L      (CSV: fluorantenas)
    naphthalene_ug_l            FLOAT,   -- µg/L      (CSV: naftalenas)
    benzo_a_pyrene_ug_l         FLOAT,   -- µg/L      (CSV: benz_a_pirenas)
    benzo_b_fluoranthene_ug_l   FLOAT,   -- µg/L      (CSV: benz_b_fluorantenas)
    benzo_k_fluoranthene_ug_l   FLOAT,   -- µg/L      (CSV: benz_k_fluorantenas)
    benzo_ghi_perylene_ug_l     FLOAT,   -- µg/L      (CSV: benz_ghi_perilenas)
    indeno_123cd_pyrene_ug_l    FLOAT,   -- µg/L      (CSV: inden_123_cd_pirenas)
    p4_n_nonylphenol_ug_l       FLOAT,   -- µg/L      (CSV: p4_n_nonilfenolis)
    p4_n_octylphenol_ug_l       FLOAT,   -- µg/L      (CSV: p4_n_oktilfenolis)
    nonylphenol_branched_ug_l   FLOAT,   -- µg/L      (CSV: p4_nonilfenolis_sakot)
    p4_tert_octylphenol_ug_l    FLOAT,   -- µg/L      (CSV: p4_tert_oktilfenolis)
    nonylphenols_total_ug_l     FLOAT,   -- µg/L      (CSV: nonilfenoliai)
    pentachlorophenol_ug_l      FLOAT,   -- µg/L      (CSV: pentachlorfenolis)
    benzene_ug_l                FLOAT,   -- µg/L      (CSV: benzenas)
    p12_dichloroethane_ug_l     FLOAT,   -- µg/L      (CSV: p12_dichloretanas)
    p123_trichlorobenzene_ug_l  FLOAT,   -- µg/L      (CSV: p123_trichlorbenzenas)
    p124_trichlorobenzene_ug_l  FLOAT,   -- µg/L      (CSV: p124_trichlorbenzenas)
    hexachlorobutadiene_ug_l    FLOAT,   -- µg/L      (CSV: heksachlorbutadienas)
    trichloroethylene_ug_l      FLOAT,   -- µg/L      (CSV: trichloretilenas)
    tetrachloromethane_ug_l     FLOAT,   -- µg/L      (CSV: tetrachlormetanas)
    dichloromethane_ug_l        FLOAT,   -- µg/L      (CSV: dichlormetanas)
    tetrachloroethylene_ug_l    FLOAT,   -- µg/L      (CSV: tetrachloretilenas)
    trichloromethane_ug_l       FLOAT,   -- µg/L      (CSV: trichlormetanas)
    aldrin_ug_l                 FLOAT,   -- µg/L      (CSV: aldrinas)
    dieldrin_ug_l               FLOAT,   -- µg/L      (CSV: dieldrinas)
    isodrin_ug_l                FLOAT,   -- µg/L      (CSV: izodrinas)
    endrin_ug_l                 FLOAT,   -- µg/L      (CSV: endrinas)
    alpha_hch_ug_l              FLOAT,   -- µg/L      (CSV: alfa_heksachlorcikloheksanas)
    beta_hch_ug_l               FLOAT,   -- µg/L      (CSV: beta_heksachlorcikloheksanas)
    gamma_hch_ug_l              FLOAT,   -- µg/L      (CSV: gama_heksachlorcikloheksanas)
    hexachlorobenzene_ug_l      FLOAT,   -- µg/L      (CSV: heksachlorbenzenas)
    pentachlorobenzene_ug_l     FLOAT,   -- µg/L      (CSV: pentachlorbenzenas)
    alpha_endosulfan_ug_l       FLOAT,   -- µg/L      (CSV: alfa_endosulfanas)
    beta_endosulfan_ug_l        FLOAT,   -- µg/L      (CSV: beta_endosulfanas)
    o_p_ddt_ug_l                FLOAT,   -- µg/L      (CSV: o_p_ddt)
    p_p_ddd_ug_l                FLOAT,   -- µg/L      (CSV: p_p_ddd)
    p_p_ddt_ug_l                FLOAT,   -- µg/L      (CSV: p_p_ddt)
    p_p_dde_ug_l                FLOAT,   -- µg/L      (CSV: p_p_dde)
    simazine_ug_l               FLOAT,   -- µg/L      (CSV: simazinas)
    atrazine_ug_l               FLOAT,   -- µg/L      (CSV: atrazinas)
    diuron_ug_l                 FLOAT,   -- µg/L      (CSV: diuronas)
    isoproturon_ug_l            FLOAT,   -- µg/L      (CSV: izoproturonas)
    quinoxyfen_ug_l             FLOAT,   -- µg/L      (CSV: chinoksifenas)
    aclonifen_ug_l              FLOAT,   -- µg/L      (CSV: aklonifenas)
    cybutryne_ug_l              FLOAT,   -- µg/L      (CSV: cibutrinas)
    terbutryn_ug_l              FLOAT,   -- µg/L      (CSV: terbutrinas)
    chlorpyrifos_ug_l           FLOAT,   -- µg/L      (CSV: chlorpyrifosas)
    chlorfenvinphos_ug_l        FLOAT,   -- µg/L      (CSV: chlorfenvinfosas)
    trifluralin_ug_l            FLOAT,   -- µg/L      (CSV: trifluralinas)
    heptachlor_ug_l             FLOAT,   -- µg/L      (CSV: heptachloras)
    heptachlor_epoxide_ug_l     FLOAT,   -- µg/L      (CSV: heptachloro_epoksidas)
    tributyltin_cation_ug_l     FLOAT,   -- µg/L      (CSV: tributilalavo_katijonas)
    dehp_ug_l                   FLOAT,   -- µg/L      (CSV: di2_etilheksilftalatas)
    bde_28_ug_l                 FLOAT,   -- µg/L      (CSV: bde_28)
    bde_47_ug_l                 FLOAT,   -- µg/L      (CSV: bde_47)
    bde_85_ug_l                 FLOAT,   -- µg/L      (CSV: bde_85)
    bde_99_ug_l                 FLOAT,   -- µg/L      (CSV: bde_99)
    bde_100_ug_l                FLOAT,   -- µg/L      (CSV: bde_100)
    bde_153_ug_l                FLOAT,   -- µg/L      (CSV: bde_153)
    bde_154_ug_l                FLOAT,   -- µg/L      (CSV: bde_154)
    pcb_28_ug_l                 FLOAT,   -- µg/L      (CSV: pcb_28)
    pcb_52_ug_l                 FLOAT,   -- µg/L      (CSV: pcb_52)
    pcb_101_ug_l                FLOAT,   -- µg/L      (CSV: pcb_101)
    pcb_118_ug_l                FLOAT,   -- µg/L      (CSV: pcb_118)
    pcb_138_ug_l                FLOAT,   -- µg/L      (CSV: pcb_138)
    pcb_153_ug_l                FLOAT,   -- µg/L      (CSV: pcb_153)
    pcb_180_ug_l                FLOAT,   -- µg/L      (CSV: pcb_180)
    pfos_ug_l                   FLOAT,   -- µg/L      (CSV: pfos)
    dicofol_ug_l                FLOAT,   -- µg/L      (CSV: dikofolis)
    alachlor_ug_l               FLOAT,   -- µg/L      (CSV: alachloras)
    bifenox_ug_l                FLOAT,   -- µg/L      (CSV: bifenoksas)
    cypermethrin_ug_l           FLOAT,   -- µg/L      (CSV: cipermetrinas)
    dichlorvos_ug_l             FLOAT,   -- µg/L      (CSV: dichlorvosas)
    p4_t_octylphenol_diethoxylate_ug_l   FLOAT,  -- µg/L (CSV: p4_t_oktilfenolio_dietoksilatas)
    p4_t_octylphenol_monoethoxylate_ug_l FLOAT,  -- µg/L (CSV: p4_t_oktilfenolio_monoetoksilatas)
    p4_t_octylphenol_triethoxylate_ug_l  FLOAT   -- µg/L (CSV: p4_t_oktilfenolio_trietoksilatas)
);