import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/Enseigne.dart';
import 'package:petrom_fidelite/models/product.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/attarikpro_detail.dart';
import 'package:petrom_fidelite/screens/car_screen.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';
import 'package:petrom_fidelite/screens/enseigne_detail.dart';
import 'package:petrom_fidelite/screens/pcard_auth.dart';
import 'package:petrom_fidelite/screens/product_detail.dart';
import 'package:petrom_fidelite/screens/product_screen.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product firstproduct = Product(
        'Carburant',
        'PETROM assure la distribution du carburant : Gasoil 10 ppm additivé et Super Sans Plomb sur l’ensemble du Royaume à travers ses 264 stations de service. PETROM propose également un service de livraison du carburant et du fuel auprès des industriels.',
        'images/carburant.png',
        1);
    Product secondproduct = Product(
        'Lubrifiants XPRO',
        'Depuis 2013, PETROM commercialise sa propre marque de lubrifiants XPRO destinée aux professionnels et particuliers. \n La nouvelle gamme de lubrifiants XPRO est une gamme complète, adaptée à tous les moteurs, et répond aux besoins véhicules de nouvelle génération ainsi qu’aux normes internationales de qualité et de performance.',
        'images/lubrifiant.png',
        0);
    Product thirdproduct = Product(
        'Produits noirs',
        'Grace à son professionnalisme et une logistique maitrisée, PETROM est leader sur le marché marocain pour la distribution du fuel atteignant 50% de la part de marché.\n La distribution du fuel représente 75% de ses activités de distribution industrielle.',
        'images/pneu.png',
        0);
    Product fourthproduct = Product(
        'Produits chimiques',
        'Avec 50% de part de marché, PETROM est leader au Maroc pour l’importation et la distribution de produits chimiques.\n PETROM importe et distribue une large gamme de produits chimiques industriels de qualité et des produits solvants tels que Solvesso, Hexane, Toluene, ou encore White spirite.\n Les principaux domaines d’activité sur lesquels nous opérons sont la peinture, le vernis, la colle, l’extraction alimentaire, les encres et l’agriculture.\n Réputé pour la qualité de ses produits chimiques et son assistance commerciale, PETROM est un partenaire de choix pour tous les acteurs du secteur.',
        'images/pneu.png',
        0);
    Product fifthproduct = Product(
        'GAZ',
        'PETROM assure la distribution de gaz butane et propane, à usage domestique ou professionnel.\n La distribution du gaz dans l’ensemble du Royaume se fait à travers 15 dépositaires PETROM répartis sur tout le territoire, qui assurent l’approvisionnement des points de vente traditionnels.\n\n· GAZ BUTANE qui est conditionné dans des bouteilles de 12 kg, 6 kg et 3 kg, dans le strict respect des normes de sécurité.\n\n· GAZ PROPANE quant à lui, est distribué en bouteilles de 34 kg, ainsi qu’en vrac lorsqu’il est destiné à un usage industriel.',
        'images/pneu.png',
        4);
    Product sixthproduct = Product(
        'PETROM CARD PREMIUM',
        'Carte à paiement différé, la Petrom Card Premium permet le règlement simple et rapide de tous les achats en stations-services ainsi que les droits de péage des Autoroutes du Maroc via le Tag JAWAZ.\n Elle dispose d’atouts incontournables :\n\n· Efficacité d’utilisation\n\n· Facilité de gestion\n\n· Sécurité renforcée\n\n· Maitrise totale',
        'images/pneu.png',
        3);
    Product seventhproduct = Product(
        'CARD PREPAYEE',
        'La Petrom Card existe également en version prépayée et rechargeable pour satisfaire les particuliers et les PME.\n Acceptées dans tous les réseaux Petrom, CPHM et Petrom Sahara, cette carte permet de régler son carburant 24h/24 et 7 jours/7.\n \nDes avantages qui rendent la vie plus facile :\n\n· Facilité\n\n· Efficacité\n\n· Maitrise\n\n· Sécurité',
        'images/pneu.png',
        3);
    Product eightproduct = Product(
        'PETROM business solutions',
        'PETROM révolutionne la gestion et le flux d’information dans son réseau en automatisant la totalité des installations et opérations en station de service en s’appuyant sur les nouvelles technologies, PETROM met au point des solutions stations intelligentes coordonnées entre elles avec précision pour des stations-services performantes.\n\n· L’accès de nos clients B2B à un portail de gestion : PRTAIL PETROM\n\n· Une solution d’approvisionnement PEMA GESTION\n\n· Une solution d’identification des véhicules avec SMART FUEL\n\n· Une solution de géolocalisation PEMA GEOLOC\n\n· Une solution intelligente et globale de gestion de flotte PEMA PARC.',
        'images/pneu.png',
        0);
    Session.lubrifiants.add(Lubrifiant(
      'XPRO REGULAR 40 ,50',
      'images/carburant.png',
      'HUILE MONOGRADE DE GRANDE QUALITE',
      'Composées d’additifs éprouvés et d’huile de base hautement raffinés, elles sont destinées aux moteurs travaillant en service léger avec des vidanges fréquentes.',
      '· Bon niveau de protection du moteur et taux d’usure réduit\n· Contrôle étendu des dépôts· Durée de vie plus longue des moteurs',
      '· Véhicules utilitaires et poids lourds\n· Tous moteurs de matériels de travaux publics, de construction, de carrière et agricoles',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO PLUS 40, 50',
      'images/carburant.png',
      'HUILE POUR MOTEUR DIESEL DE HAUTE QUALITE',
      'formulées à partir d’excellentes huiles de base et d’additifs performants ; ce sont des huiles parfaitement adaptées pour la protection des moteurs à refroidissement intermédiaire et turbocompresseurs fonctionnant en régime sévère.',
      '· Excellente stabilité thermique et contre l’oxydation pour prolonger la durée de vie de l’huile et du moteur\n· Excellente réserve TBN pour contrôler la formation des acides et des dépôts\n· Excellente protection contre la corrosion pour prolonger la durée de vie du moteur',
      '· Tout équipement à moteur diesel à aspiration naturelle et turbo compression\n· Véhicules utilitaires et poids lourds\n· Tous moteurs de matériels de travaux publics, de construction, de carrière et agricoles',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO SUPER 15W-40',
      'images/carburant.png',
      'HUILE MULTIGRADE POUR MOTEUR DIESEL DE QUALITE SUPERIEURE',
      'Elle est recommandées dans plusieurs types d’applications poids lourds et elle satisfait les conditions d’utilisation relatives au transport routier et aux équipements de travaux publics ou agricoles',
      '· Une seule huile moteur pour l’ensemble du parc en été comme en hiver\n· Protection efficace anti-usure et maintien de la propreté du moteur\n· Durée de vie plus longue des moteurs',
      '· Véhicules poids lourds, industriels et utilitaires légers\n· Equipement de travaux publics, de carrière et d’agriculture\n· Tous moteurs diesel à aspiration naturelle et turbocompressée',
    ));

    Session.lubrifiants.add(Lubrifiant(
      'XPRO ULTIM 15W-40',
      'images/carburant.png',
      'HUILE DE TRES HAUTE PERFORMANCE POUR MOTEURS DIESELS',
      'Développée à partie d’huiles de base hautement raffinées et d’additifs de performance spécifiquement sélectionnés, elle assure une protection maximale des moteurs et des espacements de vidange prolongés. Xpro ultim 15w-40 est recommandée pour la lubrification de tous les moteurs diesel suralimentés ou turbo.',
      '· Lubrifiant de fiabilité et performance exceptionnelle pour l’utilisation dans les moteurs diesel modernes ainsi que les plus anciens\n· Excellente propriété anti-usure pour une durée de vie des moteurs plus longue et des coûts de maintenance plus faibles\n· Dispersion efficace des suies conduisant à une usure parfaitement maitrisée',
      '· Moteurs diesel à aspiration naturelle, suralimentés ou turbo des principaux constructeurs japonais, européens ou américains\n· Tous moteurs des véhicules légers ou poids lourds fonctionnant à haute vitesse et/ou forte charge ainsi que les véhicules de livraison\n· Moteurs de matériels de travaux publics, agriculture, mines, carrières, etc',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO ULTIM TDX 15W-40',
      'images/carburant.png',
      'HUILES MULTIGRADES DE TRES HAUTE PERFORMANCE POUR MOTEUR DIESEL',
      'Répondant à des exigences élevées en matière d’émissions à l’échappement et nécessitant un espacement important, voire très important, entre l’intervalles de vidange. Recommandé pour les moteurs diesel moderne P.L. ou engins de chantier. Usage Universal, inclus flotte mixtes.',
      '· Conçue pour l’utilisation dans des moteurs diesel ou essence et résiste très bien aux températures élevées et aux contraintes oxydantes et thermiques qui en résultent\n· Offre une excellente protection contre l’usure\n· Protège contre la corrosion causée par les acides de combustion\n· Préserve la propreté interne du moteur et empêche l’épaississement',
      '· Lubrifiant développé pour répondre aux contraintes techniques très sévères des nouveaux moteurs Diesel à faibles émissions• Adaptée aux conditions de service les plus sévères : transports, travaux publics, carrières',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO EXTRA 20W-50',
      'images/carburant.png',
      'HUILE MOTEUR MULTIGRADE DE HAUTE PERFORMANCE',
      'c’est une huile multigrade de haute performance, pour la lubrification des moteurs essence et diesel nécessitant un niveau de performance API SG/CF-2/CF, il assure une longévité accrue des moteurs adaptés à un excellent démarrage à froid.',
      '• Facilite le démarrage à froid.\n• Diminution de la consommation d’huile.\n• Protection des organes mécaniques.',
      '• Véhicules de tourisme, industriels ou agricoles.\n• Condition estivale les plus sévères.\n• Tous moteurs diesel ou essence',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO HYPER 10W-40',
      'images/carburant.png',
      'HUILE MOTEUR MULTIGRADE DE PREMIER CHOIX POUR VÉHICULES DE TOURISME',
      'C’est une huile moteur de très haute qualité développée pour répondre aux plus hauts standards de qualité, de fiabilité et de sûreté',
      'Une protection supérieure du moteur dans une grande variété de conditions d’utilisation.\n Cette huile est également approuvée par les principaux constructeurs d’automobiles et satisfait les normes les plus récentes.\n• Excellente stabilité à l’oxydation pour réduire les dépôts dans le moteur et l’accumulation de boues pour conserver la fiabilité des moteurs\n• Excellentes propriétés à haute et basse température pour offrir une protection fiable dans une grande variété de conditions de conduite\n• Caractéristiques à basse température améliorées pour un démarrage',
      '• Lubrifiant MULTIFONTIONNEL semi-synthétique de haute qualité, spécialement formulé pour moteurs diesel et essence, (avec et sans catalyseur) y compris turbos à haute puissance et multisoupapes, dans des conditions de travail sévères.\n• Lubrifiant semi - synthétique multigrade à haute stabilité avec très bonnes qualités Anti-usure et anticorrosion.\n• Lubrifiant de longue durée par sa faible volatilité.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO ULTRA 5W-40',
      'images/carburant.png',
      'HUILE 100% SYNTHÉTIQUE',
      'Spécialement formulé avec une base synthétique et des additifs de dernière génération spécifiques à ce type de lubrifiant à hautes prestations et bas contenu en cendres sulfatées.\n Xpro Ultra 5W-40 est aux normes imposées par la lubrification des véhicules équipés de systèmes de réduction des émissions EURO 4 / EURO V, essence et diesel. Conforme à la norme ACEA C3, avec un contenu réduit en Soufre, Cendres sulfatées y Phosphore (Mid SAPS).',
      '• Excellent comportement à froid en raison de sa faible viscosité et de sa composition totalement synthétique qui facilitent la circulation du lubrifiant.\n• Facilite les démarrages à froid et la formation d´un film d´huile pour réduire de manière importante l´usure.\n• Permet également des économies en carburant.\n• Possède d´excellentes qualités de lubrification afin de satisfaire aux besoins additionnels du système pompe-injecteurs, en réduisant les frictions et en augmentant la résistance à l´usure à température élevée',
      'Pour moteurs aux normes EURO 4 /EURO V équipés de Filtres à Particules Diesel (DPF) réalisant une réduction des émissions de gaz, et contribuant ainsi à la protection de l´environnement.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO ULTRA LIGHT 5W-30',
      'images/carburant.png',
      'HUILE 100% SYNTHÉTIQUE',
      'Lubrifiant 100% synthétique « Full Economy » de haute qualité à base de PAO et des bases synthétiques du Groupe III, contient des additifs spécifiques de dernières générations qui répondent aux normes les plus exigeants, spécialement formulé pour les moteurs les plus modernes équipés d’un filtre à particules (PDF), permettant une réduction des émissions de gaz, contribuant ainsi à la préservation l’environnement.',
      '\n• Possèdes d’excellentes propriétés de lubrification pour répondre aux besoins accrus du système injecteur pompe.\n\n• Augmente la résistance à l’usure à températures élevées.\n\n• Réduit le contenu en souffre, cendres sulfatées et phosphore (Mid SAPS)',
      'Pour les nouveaux moteurs Opel-GM qui requièrent la nouvelle norme DEXOS 2. Répond aux exigences des véhicules soumis aux normes EURO 4 et EURO V. Convient aux moteurs essences ou diesel qui requièrent l’utilisation des lubrifiants aux normes ACEA.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      '2T',
      'images/carburant.png',
      'HUILE 2 TEMPS DE QUALITÉ STANDARD',
      '2T est une huile pour moteurs 2 temps utilisable dans les mobylettes et scooters nécessitant un faible dosage huile/carburant.',
      '\n• Assure une meilleure longévité du moteur\n\n• Allonge la durée de vie des bougies et des valves, réduisant le collage des segments et le serrage des pistons\n\n• Réduit le pré-allumage, améliore le rendement énergétique et allonge la durée d’utilisation des pistons',
      '\nL’huile 2T est recommandée pour la lubrification des moteurs 2 Temps des mobylettes, scooters des neiges et tronçonneuses à faible dosage d’huile dans le carburant, en particulier ceux qui demandent une qualité d’huile de niveau API TA et JASO FA.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'GEAR OIL 80W-90 & 85W-140',
      'images/carburant.png',
      'HUILE MINÉRALE POUR TRANSMISSION MÉCANIQUE',
      'Ce sont des huiles minérales pour transmission mécanique de véhicules routiers formulées à partir d’huile de base de haute qualité et d’additifs spécifiquement sélectionnés.\n Elles se révèlent particulièrement stables chimiquement et thermiquement à température élevée et sont recommandées pour la lubrification des transmissions chargées et nécessitant une huile extrême pression.',
      '\n• Excellente stabilité à l’oxydation et allongement de la durée de vie des roulements et des engrenages.\n\n• Bonne protection en fonction basse vitesse/couple élevé.\n\n• Excellente protection contre la rouille et la corrosion\n\n• Lubrification efficace à basse température.',
      '\n• Essieux et Transmissions finales fortement sollicitées\n\n• Transmission de véhicules utilitaires, poids lourds, autocars etc…\n\n• Transmission d’équipement de Travaux Publics, de carrières et agricoles\n\n• Toute transmission, transmission hypoïde incluse, fonctionnant dans des conditions difficiles.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'ATF',
      'images/carburant.png',
      'LUBRIFIANT POUR BOÎTE DE VITESSE AUTOMATIQUE',
      'L’huile ATF est formulée à partir d’huiles de base de haute qualité et d’un système d’additifs incluant des améliorants d’indice de viscosité, des antioxydants et des agents anti-mousses permettant une friction en douceur et un contrôle de l’usure. Ce lubrifiant apporte aux conducteurs une excellente réponse mécanique, même dans des conditions de conduite très diverses.',
      '\n· Bonne stabilité thermique et résistance à l’oxydation· Bonnes propriétés anti usure\n\n· Excellente fluidité à basse température\n\n· Compatible avec les joints utilisés habituellement dans les transmissions de type IID',
      '\n•L’huile ATF est recommandée pour certaines transmissions automatiques et manuelles dans les voitures de tourisme et les véhicules utilitaires légers demandant le niveau de performance Dexron IID\n\n• Transmissions, directions assistées et autres systèmes hydrauliques des matériels de chantier nécessitant un ATF de niveau Dexron IID ou Allison C-4\n\n• Systèmes hydrauliques industriels et composants',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO HD 10W',
      'images/carburant.png',
      'HUILE HYDRAULIQUE HAUTE PERFORMANCE',
      'Xpro HD 10W est une huile hydraulique de haute qualité formulée à partir d’huile de base hautement raffinée et d’additifs sélectionnés et conçue pour répondre aux exigences d’une grande variété d’équipements hydrauliques.',
      '\n• Utilisable dans une vaste gamme d’application en milieu variés\n\n• Prolonge la durée de vie des équipements et évite les arrêts de fonctionnement intempestif.\n\n• Excellente protection contre la rouille et la corrosion\n\n• Compatible avec les autres huiles moteurs utilisées dans les applications hydrauliques.',
      '\n• Système hydraulique fonctionnant dans une large plage de températures ambiantes\n\n• Système hydraulique comprenant des engrenages et des paliers pour lesquels de bonnes propriétés anti-usure sont exigées.\n\n• Matériels de travaux publics, y compris des équipements de construction, de carrière et agricoles',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'XPRO HYDRAULIC SERIES',
      'images/carburant.png',
      'HUILE HYDRAULIQUE',
      'Ce sont des huiles hydrauliques de qualité supérieure destinées à la lubrification des circuits hydrauliques d’équipements industriels ou mobiles. Leur haut niveau de stabilité chimique et à l’oxydation évite la formation de dépôts et le colmatage des systèmes.',
      '\n• Excellente performance anti-usure permettant une réduction de l’usure des pompes et un allongement de leur durée de vie\n\n• Protection contre la corrosion réduisant les effets néfastes de l’humidité sur les composants\n\n• Réduction de la formation de boues ou de dépôts\n\n• Faible moussage et bonne séparation avec l’eau\n\n• Allongement de la durée de vie de l’huile et des filtres',
      '\n• Système avec engrenages, vannes, pompes à piston radial et axial requérant des huiles anti-usure. \n\n• Application hydraulique soumise à des pollutions ou à des fuites.\n\n• Application dans lesquelles une présence d’eau est inévitable\n\n• Système avec réducteur et palier sensible à l’usure\n\n• Matériels exigeant une capacité de charge élevée\n\n• Matériels travaillant en ambiance humide requérant une protection contre la corrosion.',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'REDUCT EP SERIES',
      'images/carburant.png',
      'HUILE EXTRÊME PRESSION POUR ENGRENAGE',
      'Ce sont des huiles extrême pression de qualité supérieure destinées à la lubrification par circulation ou barbotage des engrenages. Elles ont une viscosité stable et permettent de réduire la formation de boues. Grâce à leur additivation extrême pression, les Reduct EP sont dotées de capacité de charge élevée et assurent une protection efficace contre l’usure et contre la corrosion des aciers et des alliages cuivreux.',
      '\n• Très bonne protection des engrenages et des paliers contre l’usure, allongement de leur durée de vie et diminution des interventions de maintenance.\n\n• Résistance à la formation de boues : propreté des systèmes et limitation des arrêts intempestifs.\n\n• Excellente résistance à l’oxydation : durabilité de la charge d’huile\n\n• Pas de corrosion des métaux mous : parfait fonctionnement des équipements industriels\n\n• Bon fonctionnement même en présence d’eau',
      '\n• Commandes d’entraînement de convoyeurs, agitateurs, sécheurs, ventilateurs, mélangeurs presses, cribles extrudeuses, pompes, etc…\n\n• Palier lisse et à roulement fonctionnant à faible vitesse et forte charge\n\n• Centrifugeuses, machines de ponts (treuils, grues, pompes, élévateurs etc…).',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'THERMIC 500',
      'images/carburant.png',
      'FLUIDE POUR TRANSFERT DE CHALEUR',
      'Thermic 500 est un fluide de premier choix pour transfert de chaleur. Il est utilisé pour la lubrification des circuits de chauffage et dans la plupart des applications classiques pour sa faible volatilité, sa bonne performance à basse température, sa faible corrosivité, sa viscosité relativement faible et son bon pouvoir de transfert. Le fluide est thermiquement stable et capable de durer extrêmement longtemps en service sans former de dépôts ni d’accroissement de viscosité.',
      '\n• Haute résistance aux craquages thermiques, permettant une longue vie du produit et une utilisation de l’installation sans problème.\n\n• Haut pouvoir de transfert et efficacité en service grâce aux excellentes propriétés thermiques et à sa viscosité relativement faible.\n\n• Bonne propriété à basse température pour faciliter les démarrages à froid.',
      '\n• Système à huile scellée à froid, chauffage indirect et système de refroidissement installé dans toutes sortes de processus industriels, dont la température de l’huile en circuit ne dépasse pas 315°C à pression atmosphérique.\n\n• Utilisable dans les systèmes à bain-marie à condition que la température ne dépasse pas 180°C',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'GRAISSE MULTI-USAGE LITHIUM',
      'images/carburant.png',
      'GRAISSE INDUSTRIELLE LITHIUM',
      'Graisse à base de savon lithium multi-service. Plage de température d’utilisation étendue allant de -15° à +130°C',
      '\n• Pouvoir antioxydant – longue durée d’utilisation• Insoluble dans l’eau\n\n• Facilement injectable et pompable\n\n• Bon comportement aux hautes températures.',
      '\n• Lubrification des paliers à roulements, paliers lisses, articulations et pivots.\n\n• Machines – outils• Génie civil\n\n• Transport• Agriculture',
    ));
    Session.lubrifiants.add(Lubrifiant(
      'GRAISSE LITHIUM MULTI EP',
      'images/carburant.png',
      'GRAISSE EP UNIVERSELLE',
      'Graisse extrême pression à base de savon lithium, pour tous organes chargés',
      '\n• Niveaux anti-usure et extrême pression élevés.\n\n• Protection renforcée contre la rouille, \n\n• Très bonne résistance à l’oxydation : permet de longues durées de service sans modification des propriétés,\n\n• Insoluble dans l’eau',
      '\n• Lubrification des paliers, roulements et articulations de machines travaillant dans des conditions sévères :\n\n• Fortes charges,\n\n• Chocs,\n\n• Risque de grippage ou d’usure anormale,Le grade 3 est particulièrement utilisée dans le graissage des roulements et charges des moyeux de véhicules poids lourds',
    ));
    Session.lubrifiants.add(Lubrifiant(
        'GRAISSE MULTI-USAGE CALCIUM',
        'images/carburant.png',
        'GRAISSE INDUSTRIELLE CALCIUM',
        'Graisse à base de savon calcique à usage général.',
        '\n• Résistance aux cisaillements\n\n• Adhésivité élevée\n\n• Ne durcit pas en service\n\n• Insoluble dans l’eau\n\n• Anti-oxydante',
        '\n• Graisse calcique tout usage non soumise à des conditions particulières ou spéciales.\n\n• Graissage de tout organe, travaillant dans des conditions modérées jusqu’à 65 °C'));

    Session.products = [
      firstproduct,
      secondproduct,
      sixthproduct,
      seventhproduct,
      thirdproduct,
      fourthproduct,
      fifthproduct,
      eightproduct
    ];
    Session.enseignes.clear();
    Session.enseignes.add(Enseigne(
      'L’ESCALE',
      'Idéals pour déjeuner ou dîner, et même pour prendre son petit-déjeuner ou tout simplement une pause, nos restaurants sont des lieux agréables situés tout au long des routes du Royaume. Voyageurs professionnels et familles peuvent s’y reposer durant leur trajet et ainsi faire le plein d’énergie avant de reprendre la route. Nos clients peuvent choisir des menus ou des formules à la carte, selon leur envie, et bénéficier ainsi d’un large choix pour se restaurer le temps d’un repas ou d’une pause rapide !',
      'images/enseignesescale.jpeg',
    ));
    Session.enseignes.add(Enseigne(
      'Eléphant bleu',
      'Leader européen des stations de lavage automobile, Eléphant Bleu est présent au Maroc en exclusivité chez Petrom. Nous vous proposons ainsi toute une gamme de services et de solutions pour nettoyer votre voiture, votre camping-car ou votre moto. Nos stations sont réputées pour l’implication et le professionnalisme de nos équipes. Vous y disposerez de conseils et du choix du mode de lavage : jets haute pression ou portique automatique, toujours dans le respect de votre carrosserie.',
      'images/enseigneselephantbleu.png',
    ));
    Session.enseignes.add(Enseigne(
      'VENEZIA ICE & BAKERY',
      'Inspirée de Venise, la ville où règne charme et romantisme à chaque coin de rue, Venezia Ice est née pour adoucir les petits plaisirs des marocains et les rendre amoureux des glaces italiennes.Venezia Ice a transmis progressivement sa passion au cœur ... Venezia Ice, une marque qui allie la qualité au professionnalisme et la tradition à l'
          'innovation.L’idée première derrière la création du concept Venezia Ice était de séduire et conquérir une clientèle de tous âges et de lui proposer de déguster un large éventail de parfums de crèmes glacées.',
      'images/enseignesVeniziaIce.png',
    ));

    Session.enseignes.add(Enseigne(
      'CIH BANK',
      'CIH BANK votre banque à service premium introduit la dernière génération de guichets automatiques bancaires (GAB) dans des stations-services PETROM, accessible à tout moment en toute autonomie et en toute sécurité, 24/24 et 7j/7.',
      'images/enseigneCIHBank.jpeg',
    ));
    Session.enseignes.add(Enseigne(
      'BOSH SERVICE',
      'Bosh Car Service est aujourd’hui le plus grand réseau d’ateliers indépendant de marque Bosch. Avec plus de 15000 garages dans 150 pays, Bosch Car Service répond à tous vos souhaits et exigences individuels pour votre véhicule avec ses services d’entretien complets.',
      'images/enseignebosch.jpeg',
    ));

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.greysecondary],
            begin: Alignment.topCenter),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Session.infosUser.data.user.codeSap != ''
                        ? TopButtons(context)
                        : new Container(),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              textAlign: TextAlign.left,
                              'Nos Avantages exclusifs ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: getAttarikProWidget(context),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              textAlign: TextAlign.left,
                              'Nos Produits ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ProductScreen.screenRoute)
                                  .then(
                                (result) {
                                  if (result != null) {
                                    // removeItem(result);
                                  }
                                },
                              );
                            },
                            child: Image(
                              image: AssetImage('images/arrowright.png'),
                              color: Colors.blueprimary,
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      child: SizedBox(
                        height: 180,
                        child: ListView.builder(
                          itemCount: Session.products.length,
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return buildProduct(
                                context, Session.products[index]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          textAlign: TextAlign.left,
                          'Nos Enseignes et partenaires',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueprimary,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      child: SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: Session.enseignes.length,
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(children: [
                              Center(
                                  child: buildEnseigne(
                                      context, Session.enseignes[index]))
                            ]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Container(
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       textAlign: TextAlign.left,
                    //       'Nos Offres Petrom ',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.blueprimary,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       maxLines: 4,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 12),
                    // Container(
                    //   child: SizedBox(
                    //     height: 140,
                    //     child: ListView.builder(
                    //       itemCount: Session.enseignes.length,
                    //       clipBehavior: Clip.none,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Column(children: [
                    //           Center(
                    //               child: buildOffre(
                    //                   context, Session.enseignes[index]))
                    //         ]);
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProduct(BuildContext context, Product product) => Container(
        margin: EdgeInsets.only(right: 15),
        child: InkWell(
          onTap: () {
            if (product is Lubrifiant) {}

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(product: product)));
          },
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            shadowColor: Colors.bluesecondary,
            child: Container(
              width: 200,
              height: 30,
              child: Column(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage(product.image),
                      height: 60,
                      width: 60,
                      color: Colors.bluesecondary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(product.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.bluesecondary,fontSize: 14)),
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            textAlign: TextAlign.center,
                            product.description,
                            maxLines: 2,
                            style: TextStyle(color: Colors.grey,fontSize: 10,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildCarte() => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        shadowColor: Colors.grey[50],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 250,
          height: 30,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bluebg.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage('images/cartepro1.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text('carburant')),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Notre priorité : assurer la distribution de produits de qualité en permanence et sur l’ensemble du territoire marocain.',
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget TopButtons(BuildContext context) => Column(
        children: [
          SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 4,
                shadowColor: Colors.grey[50],
                child: OutlinedButton(
                  onPressed: () => {
                    if (Session.infosUser.data.user.codeSap != '')
                      {
                        Navigator.of(context)
                            .pushNamed(CarPage.screenRoute)
                            .then(
                          (result) {
                            if (result != null) {
                              // removeItem(result);
                            }
                          },
                        )
                      }
                    else
                      {
                        Navigator.of(context)
                            .pushNamed(PcardAuthPage.screenRoute)
                            .then(
                          (result) {
                            if (result != null) {
                              // removeItem(result);
                            }
                          },
                        )
                      }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      backgroundColor: Colors.blueprimary,
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Vehicule', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 12),
                      Image(
                          image: AssetImage('images/auto.png'),
                          height: 30,
                          width: 30,
                          color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              shadowColor: Colors.greyprimary,
              child: OutlinedButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed(AlertePage.screenRoute).then(
                    (result) {
                      if (result != null) {
                        // removeItem(result);
                      }
                    },
                  )
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greysecondary,
                    fixedSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    side: BorderSide(width: 2.0, color: Colors.blueprimary),
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Alerte', style: TextStyle(color: Colors.blueprimary)),
                    SizedBox(width: 12),
                    Image(
                        image: AssetImage('images/alerte.png'),
                        height: 30,
                        width: 30,
                        color: Colors.blueprimary),
                  ],
                ),
              ),
            ))
          ]),
        ],
      );

  Widget buildEnseigne(BuildContext context, Enseigne enseigne) => Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EnseigneDetail(enseigne: enseigne)));
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
                  border: Border.all(
                    color: Colors.bluesecondary, // Border color
                    width: 1, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greyprimary,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes the shadow direction
                    ),
                  ],
                ),
                width: 140,
                height: 100,
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(enseigne.image),
                        height: 40,
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ),

          ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                    textAlign: TextAlign.center,
                    enseigne.title,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.bluesecondary)),
              )))
        ]),
      );

  Widget getAttarikProWidget(BuildContext context) => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.greysecondary, Colors.blueprimary],
              begin: Alignment.topLeft),
          borderRadius: BorderRadius.circular(3),
        ),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AttarikProDetail.screenRoute).then(
              (result) {
                if (result != null) {
                  // removeItem(result);
                }
              },
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage('images/petrom_logo.png'),
                  height: 50,
                  width: 50,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Carte de fidélité',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right),
                        Text(
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          'Attarik Pro',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget buildOffre(BuildContext context, Enseigne enseigne) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(right: 15),
        child: Column(children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EnseigneDetail(enseigne: enseigne)));
            },
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              shadowColor: Colors.grey[50],
              child: Container(
                width: 200,
                height: 100,
                child: Center(child: Text('Offre')),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                    textAlign: TextAlign.center,
                    'Offre',
                    maxLines: 3,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ]),
      );
}
