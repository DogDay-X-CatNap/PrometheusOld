local Ast = require("prometheus.ast");

local dictionary = {
	"getfenv",
	"print",
	"game",
	"GetService",
	"HttpService",
	"require",
	"loadstring",
	"string",
	"dump",
	"Prometheus",
	"setmetatable",
	"__index",
	"__newindex",
	"__metatable",
	"workspace",
	"api",
	"You wasted time while looking at this String!",
	"Hello, World!",
	"setfenv",
	"IlII1llIIll1llllI11",
	"WW91IHdhc3RlZCB0aW1lIHdoaWxlIGxvb2tpbmcgYXQgdGhpcyBTdHJpbmch",
	"Acantha",
	"Achilles",
	"Achilleus",
	"Adad",
	"Aditi",
	"Aditya",
	"Adonis",
	"Adrastea",
	"Adrasteia",
	"Adrastos",
	"Aegle",
	"Aella",
	"Aeneas",
	"Aeolus",
	"Aeron",
	"Aeson",
	"Agamemnon",
	"Agaue",
	"Aglaea",
	"Aglaia",
	"Agni",
	"Agrona",
	"Ahriman",
	"Ahti",
	"Ahura",
	"Aias",
	"Aigle",
	"Ailill",
	"Aineias",
	"Aino",
	"Aiolos",
	"Ajax",
	"Akantha",
	"Alberic",
	"Alberich",
	"Alcides",
	"Alcippe",
	"Alcmene",
	"Alcyone",
	"Alecto",
	"Alekto",
	"Alexander",
	"Alexandra",
	"Alexandros",
	"Alf",
	"Alfr",
	"Alkeides",
	"Alkippe",
	"Alkmene",
	"Alkyone",
	"Althea",
	"Alvis",
	"Alvíss",
	"Amalthea",
	"Amaterasu",
	"Amen",
	"Ameretat",
	"Amirani",
	"Ammon",
	"Amon",
	"Amon-ra",
	"Amor",
	"Amordad",
	"Amulius",
	"Amun",
	"Amurdad",
	"An",
	"Anahit",
	"Anahita",
	"Anaitis",
	"Ananta",
	"Anapa",
	"Anat",
	"Anath",
	"Anatu",
	"Andraste",
	"Andromache",
	"Andromeda",
	"Angerona",
	"Angharad",
	"Angra",
	"Anil",
	"Aniruddha",
	"Anoubis",
	"Anthea",
	"Antheia",
	"Antigone",
	"Antiope",
	"Anu",
	"Anubis",
	"Aodh",
	"Aodhán",
	"Aoede",
	"Aoide",
	"Aoife",
	"Aonghus",
	"Aparna",
	"Aphrodite",
	"Apollo",
	"Apollon",
	"Ara",
	"Arachne",
	"Aramazd",
	"Aranrhod",
	"Arash",
	"Arawn",
	"Ares",
	"Arethousa",
	"Arethusa",
	"Argus",
	"Ariadne",
	"Arianrhod",
	"Aries",
	"Aristaeus",
	"Aristaios",
	"Aristodemos",
	"Arjuna",
	"Armazi",
	"Artemis",
	"Arthur",
	"Aruna",
	"Arundhati",
	"Arushi",
	"Asar",
	"Asclepius",
	"Asherah",
	"Ashtad",
	"Ashtoreth",
	"Ashur",
	"Ask",
	"Asklepios",
	"Askr",
	"Astarte",
	"Astraea",
	"Astraia",
	"Atalanta",
	"Atem",
	"Aten",
	"Athena",
	"Athene",
	"Atlas",
	"Atli",
	"Aton",
	"Atropos",
	"Atum",
	"Aurora",
	"Austėja",
	"Azrael",
	"Ba'al",
	"Baal",
	"Bacchus",
	"Bahman",
	"Bahram",
	"Bala",
	"Baladeva",
	"Balder",
	"Baldr",
	"Baltazar",
	"Balthasar",
	"Balthazar",
	"Barlaam",
	"Bast",
	"Bastet",
	"Batraz",
	"Bedivere",
	"Bedwyr",
	"Bel",
	"Belenos",
	"Belenus",
	"Beli",
	"Belial",
	"Bellona",
	"Beowulf",
	"Bharata",
	"Bhaskara",
	"Bhima",
	"Bhumi",
	"Bile",
	"Blodeuwedd",
	"Bláthnat",
	"Borghild",
	"Borghildr",
	"Brage",
	"Bragi",
	"Brahma",
	"Bran",
	"Branwen",
	"Bridget",
	"Brighid",
	"Brigid",
	"Brigit",
	"Brijesha",
	"Briseis",
	"Brontes",
	"Brunhild",
	"Brynhild",
	"Brynhildr",
	"Brân",
	"Brünhild",
	"Byelobog",
	"Bébinn",
	"Cadmus",
	"Cai",
	"Calliope",
	"Callisto",
	"Calypso",
	"Camilla",
	"Cardea",
	"Carme",
	"Caspar",
	"Cassandra",
	"Cassiopea",
	"Cassiopeia",
	"Castor",
	"Cephalus",
	"Cepheus",
	"Cerberus",
	"Cerere",
	"Ceres",
	"Cernunnos",
	"Chalchiuhticue",
	"Chanda",
	"Chandra",
	"Charon",
	"Chernobog",
	"Chi",
	"Chloe",
	"Chloris",
	"Chryseis",
	"Chryses",
	"Chukwu",
	"Cian",
	"Circe",
	"Clio",
	"Clotho",
	"Clytemnestra",
	"Clytia",
	"Clídna",
	"Clíodhna",
	"Coeus",
	"Conall",
	"Conchobar",
	"Conchobhar",
	"Conchúr",
	"Concordia",
	"Conlaoch",
	"Connla",
	"Conor",
	"Consus",
	"Cora",
	"Crius",
	"Cronus",
	"Culhwch",
	"Cupid",
	"Cupido",
	"Cybele",
	"Cynthia",
	"Cáel",
	"Céibhfhionn",
	"Cúchulainn",
	"Daedalus",
	"Dagan",
	"Dagda",
	"Dagon",
	"Daidalos",
	"Daireann",
	"Dalia",
	"Damayanti",
	"Damocles",
	"Damodara",
	"Damokles",
	"Damon",
	"Danaë",
	"Daphne",
	"Dardanos",
	"Dazbog",
	"Dazhdbog",
	"Deianeira",
	"Deianira",
	"Deimos",
	"Deirdre",
	"Delia",
	"Demeter",
	"Derdriu",
	"Despoina",
	"Devaraja",
	"Devi",
	"Diana",
	"Diarmaid",
	"Diarmait",
	"Diarmuid",
	"Dido",
	"Dike",
	"Dilipa",
	"Dinesha",
	"Diomedes",
	"Dione",
	"Dionysos",
	"Dionysus",
	"Dipaka",
	"Dismas",
	"Djehuti",
	"Doireann",
	"Doirend",
	"Donar",
	"Doris",
	"Draupadi",
	"Drupada",
	"Dumuzi",
	"Dumuzid",
	"Durga",
	"Dushyanta",
	"Dwyn",
	"Dylan",
	"Dáire",
	"Ea",
	"Echo",
	"Ehecatl",
	"Eigyr",
	"Eileithyia",
	"Eir",
	"Eirene",
	"El",
	"Electra",
	"Elektra",
	"Elil",
	"Elissa",
	"Ellil",
	"Elpis",
	"Embla",
	"Emer",
	"Endymion",
	"Enid",
	"Enki",
	"Enlil",
	"Enyo",
	"Eoghan",
	"Eos",
	"Epimetheus",
	"Epona",
	"Erato",
	"Erebos",
	"Erebus",
	"Ereshkigal",
	"Eris",
	"Erna",
	"Eros",
	"Etzel",
	"Euadne",
	"Euandros",
	"Euanthe",
	"Eudora",
	"Eunomia",
	"Euphrosyne",
	"Europa",
	"Europe",
	"Euryalos",
	"Euryalus",
	"Eurydice",
	"Eurydike",
	"Euterpe",
	"Evadne",
	"Evander",
	"Evandrus",
	"Eógan",
	"Fachtna",
	"Fauna",
	"Faunus",
	"Fearghas",
	"Fedelm",
	"Fedelmid",
	"Fedlimid",
	"Feidelm",
	"Feidlimid",
	"Felicitas",
	"Fereydoun",
	"Fergus",
	"Fiachra",
	"Finn",
	"Finnguala",
	"Finnuala",
	"Fintan",
	"Fionn",
	"Fionnghuala",
	"Fionnuala",
	"Flora",
	"Frea",
	"Frey",
	"Freya",
	"Freyja",
	"Freyr",
	"Frige",
	"Frigg",
	"Gabija",
	"Gaea",
	"Gaia",
	"Gandalf",
	"Ganesha",
	"Ganymede",
	"Ganymedes",
	"Gargi",
	"Gaspar",
	"Gauri",
	"Gayatri",
	"Gemini",
	"Geraint",
	"Gerd",
	"Gilgamesh",
	"Giove",
	"Girisha",
	"Giunone",
	"Glaucus",
	"Glaukos",
	"Glooscap",
	"Goibniu",
	"Gopala",
	"Gopinatha",
	"Goronwy",
	"Gotama",
	"Govad",
	"Govannon",
	"Govinda",
	"Grid",
	"Grimhilt",
	"Gráinne",
	"Grímhildr",
	"Gróa",
	"Gudrun",
	"Gundahar",
	"Gunnar",
	"Gunnarr",
	"Gunnr",
	"Guðrún",
	"Gwalchmei",
	"Gwenhwyfar",
	"Gwydion",
	"Günther",
	"Hadad",
	"Hades",
	"Hagano",
	"Hagen",
	"Haides",
	"Halcyone",
	"Halkyone",
	"Hama",
	"Hammon",
	"Hari",
	"Harisha",
	"Harmonia",
	"Hathor",
	"Haurvatat",
	"Hebe",
	"Hecate",
	"Hector",
	"Hecuba",
	"Heidrun",
	"Heimir",
	"Heiðrún",
	"Hekabe",
	"Hekate",
	"Hektor",
	"Hel",
	"Helen",
	"Helena",
	"Helene",
	"Helios",
	"Helle",
	"Hemera",
	"Hephaestus",
	"Hephaistos",
	"Hera",
	"Heracles",
	"Herakles",
	"Hercules",
	"Hermes",
	"Hermione",
	"Hero",
	"Hersilia",
	"Heru",
	"Hestia",
	"Het-heru",
	"Hildr",
	"Hippolyta",
	"Hippolyte",
	"Hippolytos",
	"Hormazd",
	"Horos",
	"Horus",
	"Huitzilopochtli",
	"Huld",
	"Hulda",
	"Hvare",
	"Hyacinth",
	"Hyacinthus",
	"Hyakinthos",
	"Hyperion",
	"Iacchus",
	"Iah",
	"Ianthe",
	"Ianus",
	"Iapetos",
	"Iapetus",
	"Iason",
	"Icarus",
	"Idun",
	"Ikaros",
	"Ilithyia",
	"Ilmarinen",
	"Ilmatar",
	"Ilu",
	"Inanna",
	"Indira",
	"Indra",
	"Indrajit",
	"Indrani",
	"Ing",
	"Inti",
	"Io",
	"Ioachim",
	"Ioakeim",
	"Iokaste",
	"Iole",
	"Ion",
	"Ione",
	"Iovis",
	"Iphigeneia",
	"Iphigenia",
	"Irene",
	"Iris",
	"Iset",
	"Isha",
	"Ishkur",
	"Ishtar",
	"Isis",
	"Ismene",
	"Israfil",
	"Italus",
	"Iuno",
	"Iuppiter",
	"Iuturna",
	"Ixchel",
	"Izanagi",
	"Izanami",
	"Izrail",
	"Iðunn",
	"Jagadisha",
	"Jagannatha",
	"Jam",
	"Jamshed",
	"Jamsheed",
	"Jamshid",
	"Janus",
	"Jarl",
	"Jason",
	"Jasper",
	"Jaya",
	"Jayanta",
	"Jayanti",
	"Jeremiel",
	"Jimmu",
	"Joachim",
	"Jocasta",
	"Joukahainen",
	"Jove",
	"Juno",
	"Junon",
	"Jupiter",
	"Juturna",
	"Juventas",
	"Júpiter",
	"K'awiil",
	"Kadmos",
	"Kali",
	"Kalliope",
	"Kallisto",
	"Kalyani",
	"Kalypso",
	"Kama",
	"Kamakshi",
	"Kamala",
	"Kanti",
	"Kapila",
	"Karme",
	"Karna",
	"Karthikeyan",
	"Kartikeya",
	"Kassandra",
	"Kassiopeia",
	"Kastor",
	"Kausalya",
	"Kaveh",
	"Kay",
	"Kephalos",
	"Kepheus",
	"Kerberos",
	"Khordad",
	"Khshaeta",
	"Khurshid",
	"Ki",
	"Kirke",
	"Kleio",
	"Klotho",
	"Klytaimnestra",
	"Klytië",
	"Koios",
	"Kore",
	"Korë",
	"Kreios",
	"Kriemhild",
	"Krishna",
	"Kronos",
	"Kshaeta",
	"Kshathra",
	"Kukulkan",
	"Kumara",
	"Kumari",
	"Kunti",
	"Kybele",
	"Kyllikki",
	"Kynthia",
	"Kára",
	"Lachesis",
	"Lada",
	"Laima",
	"Laios",
	"Laius",
	"Lakshmana",
	"Lakshmi",
	"Lalita",
	"Lamia",
	"Lara",
	"Larisa",
	"Larissa",
	"Larunda",
	"Latona",
	"Lauma",
	"Laverna",
	"Lavinia",
	"Leander",
	"Leandros",
	"Lech",
	"Leda",
	"Lemminkäinen",
	"Ler",
	"Leto",
	"Liber",
	"Libitina",
	"Ligeia",
	"Lilith",
	"Linos",
	"Linus",
	"Lir",
	"Lleu",
	"Llew",
	"Llyr",
	"Loke",
	"Loki",
	"Louhi",
	"Loviatar",
	"Lucifer",
	"Lucina",
	"Lucretia",
	"Lug",
	"Lugaid",
	"Lugalbanda",
	"Lugh",
	"Lughaidh",
	"Lugos",
	"Lugus",
	"Luna",
	"Luned",
	"Lunete",
	"Lycurgus",
	"Lycus",
	"Lykos",
	"Lykourgos",
	"Lyssa",
	"Lóegaire",
	"Lú",
	"Mabon",
	"Madhava",
	"Madhavi",
	"Maeve",
	"Magni",
	"Mahesha",
	"Maia",
	"Mainyu",
	"Manah",
	"Mani",
	"Manoja",
	"Manu",
	"Marama",
	"Marduk",
	"Mari",
	"Mars",
	"Marte",
	"Marzanna",
	"Math",
	"Maui",
	"Maya",
	"Mazda",
	"Meadhbh",
	"Medb",
	"Medea",
	"Medeia",
	"Medousa",
	"Medraut",
	"Medrod",
	"Medusa",
	"Megaera",
	"Megaira",
	"Mehr",
	"Melaina",
	"Melanthios",
	"Melchior",
	"Melete",
	"Melia",
	"Melissa",
	"Melpomene",
	"Melqart",
	"Melusine",
	"Menelaos",
	"Menelaus",
	"Mentor",
	"Mercurius",
	"Mercury",
	"Metis",
	"Metztli",
	"Meztli",
	"Mictlantecuhtli",
	"Midas",
	"Mielikki",
	"Milda",
	"Mina",
	"Minakshi",
	"Minerva",
	"Minos",
	"Mithra",
	"Mithras",
	"Mitra",
	"Mneme",
	"Mnemosyne",
	"Modred",
	"Mohana",
	"Mohini",
	"Mokosh",
	"Morana",
	"Mordad",
	"Mordred",
	"Morpheus",
	"Morrigan",
	"Mot",
	"Muirenn",
	"Muirgen",
	"Muirne",
	"Mukesha",
	"Murali",
	"Murugan",
	"Myles",
	"Myrddin",
	"Méabh",
	"Mór",
	"Mórríghan",
	"Māra",
	"Nabu",
	"Naenia",
	"Nagendra",
	"Nairyosangha",
	"Nala",
	"Nanabozho",
	"Nanaea",
	"Nanaia",
	"Nanaya",
	"Nanda",
	"Nanna",
	"Naoise",
	"Narayana",
	"Narcissus",
	"Narkissos",
	"Nausicaa",
	"Nausikaa",
	"Neas",
	"Neasa",
	"Nechtan",
	"Neilos",
	"Neith",
	"Nemesis",
	"Neoptolemos",
	"Neoptolemus",
	"Nephele",
	"Nephthys",
	"Neptune",
	"Neptuno",
	"Neptunus",
	"Nereus",
	"Nerthus",
	"Ness",
	"Nessa",
	"Nestor",
	"Nettuno",
	"Netuno",
	"Niamh",
	"Nike",
	"Nikephoros",
	"Nilus",
	"Ningal",
	"Ninhursag",
	"Ninlil",
	"Ninsumun",
	"Ninsun",
	"Ninurta",
	"Niobe",
	"Nisus",
	"Nit",
	"Njord",
	"Njáll",
	"Njǫrðr",
	"Nokomis",
	"Nona",
	"Nuada",
	"Nuadha",
	"Nudd",
	"Nuha",
	"Numitor",
	"Nyx",
	"Nyyrikki",
	"Oceanus",
	"Oden",
	"Odin",
	"Odysseus",
	"Oedipus",
	"Oenone",
	"Oidipous",
	"Oinone",
	"Oisín",
	"Okeanos",
	"Onnophris",
	"Onouphrios",
	"Onuphrius",
	"Orestes",
	"Orion",
	"Ormazd",
	"Orpheus",
	"Orvar",
	"Oscar",
	"Osiris",
	"Ourania",
	"Ouranos",
	"Owain",
	"Padma",
	"Padmavati",
	"Pallas",
	"Pan",
	"Pandora",
	"Pankaja",
	"Papa",
	"Paris",
	"Partha",
	"Parthalán",
	"Parthenia",
	"Parthenope",
	"Parvati",
	"Patroclus",
	"Patroklos",
	"Pax",
	"Pegasus",
	"Pekko",
	"Pele",
	"Penelope",
	"Peredur",
	"Persephone",
	"Perseus",
	"Perun",
	"Phaedra",
	"Phaenna",
	"Phaidra",
	"Phanuel",
	"Philander",
	"Philandros",
	"Philomela",
	"Phobos",
	"Phoebe",
	"Phoebus",
	"Phoibe",
	"Phoibos",
	"Phrixos",
	"Phrixus",
	"Phyllis",
	"Pistis",
	"Pitambara",
	"Plouton",
	"Pluto",
	"Pollux",
	"Polydeukes",
	"Polyhymnia",
	"Polymnia",
	"Polyxena",
	"Polyxene",
	"Pomona",
	"Poseidon",
	"Prabhakara",
	"Prabhu",
	"Pramoda",
	"Praxis",
	"Priam",
	"Priamos",
	"Priapos",
	"Priapus",
	"Pritha",
	"Priya",
	"Prometheus",
	"Proserpina",
	"Proserpine",
	"Proteus",
	"Pryderi",
	"Psyche",
	"Ptah",
	"Puck",
	"Purushottama",
	"Pwyll",
	"Pyrrhos",
	"Pyrrhus",
	"Pythios",
	"Quetzalcoatl",
	"Quirinus",
	"Ra",
	"Radha",
	"Radhika",
	"Raghu",
	"Raguel",
	"Raiden",
	"Raijin",
	"Rajani",
	"Rama",
	"Ramachandra",
	"Ramesha",
	"Rameshvara",
	"Ramiel",
	"Rangi",
	"Rashn",
	"Rashnu",
	"Rati",
	"Ravi",
	"Ravindra",
	"Raziel",
	"Re",
	"Remus",
	"Reva",
	"Rhea",
	"Rheie",
	"Rhiannon",
	"Rigantona",
	"Romulus",
	"Rostam",
	"Rukmini",
	"Ríghnach",
	"Ríoghain",
	"Ríoghnach",
	"Saam",
	"Sabia",
	"Sadb",
	"Sadbh",
	"Sadhbh",
	"Saga",
	"Salacia",
	"Sam",
	"Samael",
	"Sampo",
	"Sandhya",
	"Sanjaya",
	"Saraswati",
	"Sarosh",
	"Sarpedon",
	"Sati",
	"Satisha",
	"Saturn",
	"Saturnus",
	"Saule",
	"Sauliā",
	"Saulė",
	"Savitr",
	"Savitri",
	"Sedna",
	"Selena",
	"Selene",
	"Semele",
	"Seppo",
	"Set",
	"Seth",
	"Shahrivar",
	"Shailaja",
	"Shakti",
	"Shakuntala",
	"Shalim",
	"Shamash",
	"Shams",
	"Shani",
	"Shankara",
	"Shanta",
	"Shantanu",
	"Shiva",
	"Shivali",
	"Shri",
	"Shridevi",
	"Shripati",
	"Shulmanu",
	"Shyama",
	"Siavash",
	"Siegfried",
	"Sieglinde",
	"Sif",
	"Signý",
	"Sigrún",
	"Sigurd",
	"Sigurðr",
	"Silvanus",
	"Silvia",
	"Silvius",
	"Simon",
	"Sin",
	"Sindri",
	"Sionann",
	"Sita",
	"Siv",
	"Skadi",
	"Skanda",
	"Skaði",
	"Skuld",
	"Sláine",
	"Sohrab",
	"Soroush",
	"Sosruko",
	"Sraosha",
	"Stribog",
	"Su'en",
	"Subrahmanya",
	"Sumati",
	"Summanus",
	"Sundara",
	"Sunita",
	"Surendra",
	"Suresha",
	"Surya",
	"Sushila",
	"Sutekh",
	"Svanhild",
	"Svanhildr",
	"Svantovit",
	"Svarog",
	"Svetovid",
	"Tahmuras",
	"Takhma",
	"Tammuz",
	"Tane",
	"Tangaroa",
	"Tanis",
	"Tanit",
	"Tanith",
	"Tapio",
	"Tara",
	"Taranis",
	"Tarhunna",
	"Tarhunz",
	"Tatius",
	"Tellervo",
	"Terminus",
	"Terpsichore",
	"Teshub",
	"Tethys",
	"Tezcatlipoca",
	"Thaleia",
	"Thalia",
	"Thanatos",
	"Theia",
	"Themis",
	"Theseus",
	"Thor",
	"Thoth",
	"Tiamat",
	"Tisiphone",
	"Tiw",
	"Tlaloc",
	"Trym",
	"Turnus",
	"Tuulikki",
	"Tyche",
	"Tychon",
	"Tyr",
	"Týr",
	"Ukko",
	"Ulysses",
	"Uma",
	"Urania",
	"Uranus",
	"Urd",
	"Urien",
	"Urupi",
	"Usha",
	"Ushas",
	"Uther",
	"Uthyr",
	"Uttara",
	"Utu",
	"Vahagn",
	"Vairya",
	"Vaishnavi",
	"Valli",
	"Varuna",
	"Vasanta",
	"Vasu",
	"Vayu",
	"Veles",
	"Vellamo",
	"Vena",
	"Venere",
	"Venus",
	"Verdandi",
	"Verethragna",
	"Vesta",
	"Victoria",
	"Vidar",
	"Vidya",
	"Vijaya",
	"Vikrama",
	"Viraja",
	"Vishnu",
	"Vohu",
	"Volos",
	"Vulcan",
	"Vulcanus",
	"Väinämöinen",
	"Vénus",
	"Vênus",
	"Víðarr",
	"Völund",
	"Völundr",
	"Weland",
	"Wieland",
	"Wodan",
	"Woden",
	"Wotan",
	"Xanthe",
	"Xanthos",
	"Xochipilli",
	"Xochiquetzal",
	"Yam",
	"Yama",
	"Yamanu",
	"Yami",
	"Yeruslan",
	"Yima",
	"Yngvi",
	"Zal",
	"Zaramama",
	"Zephyr",
	"Zephyros",
	"Zephyrus",
	"Zerachiel",
	"Zeus",
	"Áed",
	"Áedán",
	"Éber",
	"Éibhear",
	"Éimhear",
	"Ériu",
	"Étaín",
	"Óengus",
	"Óðinn",
	"Þrymr",
	"Þunor",
	"Þórr",
	"Šiwa",
	"Živa",
	"Ǫrvar",
	"JHVH",
}

local function randomString(words)
	local dictionary = words or dictionary;
	return dictionary[math.random(1, #dictionary)];
end

local function randomStringNode(words)
	return Ast.StringExpression(randomString(words))
end

return {
	randomString = randomString,
	randomStringNode = randomStringNode,
	dictionary = dictionary,
}